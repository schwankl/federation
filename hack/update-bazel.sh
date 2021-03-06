#!/usr/bin/env bash
# Copyright 2016 The Kubernetes Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -o errexit
set -o nounset
set -o pipefail

export KUBE_ROOT=$(dirname "${BASH_SOURCE}")/..
source "${KUBE_ROOT}/hack/lib/init.sh"

if LANG=C sed --help 2>&1 | grep -q GNU; then
  SED="sed"
elif which gsed &>/dev/null; then
  SED="gsed"
else
  echo "Failed to find GNU sed as sed or gsed. If you are on Mac: brew install gnu-sed." >&2
  exit 1
fi

# Remove generated files prior to running kazel.
# TODO(spxtr): Remove this line once Bazel is the only way to build.
GENERATED_FILENAME="/pkg/generated/openapi/zz_generated.openapi.go"
rm -f "${KUBE_ROOT}/${GENERATED_FILENAME}"
rm -f "${KUBE_ROOT}/vendor/k8s.io/kubernetes/${GENERATED_FILENAME}"

# The git commit sha1s here should match the values in $KUBE_ROOT/WORKSPACE.
# TODO(marun) Update to point to official repo when required changes merge
kube::util::go_install_from_commit \
    github.com/kubernetes/repo-infra/kazel \
    ae4e9a3906ace4ba657b7a09242610c6266e832c
kube::util::go_install_from_commit \
    github.com/bazelbuild/rules_go/go/tools/gazelle/gazelle \
    c72631a220406c4fae276861ee286aaec82c5af2

touch "${KUBE_ROOT}/vendor/BUILD"

gazelle fix \
    -build_file_name=BUILD,BUILD.bazel \
    -external=vendored \
    -proto=legacy \
    -mode=fix

# Ignore unneeded rebuild for vendored openapi
kazel | grep -vq 'vendor/k8s.io/kubernetes/pkg/generated/openapi/BUILD' && true

# Rewrite the openapi BUILD file for federation to work for building
# openapi for vendored kube.  This seems simpler than fixing kazel to
# support generating for federation and vendored kube in a single
# pass.
sed '/federation/d' pkg/generated/openapi/BUILD \
    | sed 's|\(, "openapi_go_prefix"\)|\1, "openapi_vendor_prefix"|' \
    | sed 's|\(vendor_prefix = \).*|\1openapi_vendor_prefix,|' \
    > vendor/k8s.io/kubernetes/pkg/generated/openapi/BUILD
