load("@io_bazel_rules_go//go:def.bzl", "go_library")

go_library(
    name = "go_default_library",
    srcs = [
        "load.go",
        "save.go",
        "tarexport.go",
    ],
    importpath = "github.com/docker/docker/image/tarexport",
    visibility = ["//visibility:public"],
    deps = [
        "//vendor/github.com/docker/distribution:go_default_library",
        "//vendor/github.com/docker/distribution/reference:go_default_library",
        "//vendor/github.com/docker/docker/image:go_default_library",
        "//vendor/github.com/docker/docker/image/v1:go_default_library",
        "//vendor/github.com/docker/docker/layer:go_default_library",
        "//vendor/github.com/docker/docker/pkg/archive:go_default_library",
        "//vendor/github.com/docker/docker/pkg/chrootarchive:go_default_library",
        "//vendor/github.com/docker/docker/pkg/progress:go_default_library",
        "//vendor/github.com/docker/docker/pkg/streamformatter:go_default_library",
        "//vendor/github.com/docker/docker/pkg/stringid:go_default_library",
        "//vendor/github.com/docker/docker/pkg/symlink:go_default_library",
        "//vendor/github.com/docker/docker/pkg/system:go_default_library",
        "//vendor/github.com/docker/docker/reference:go_default_library",
        "//vendor/github.com/opencontainers/go-digest:go_default_library",
        "//vendor/github.com/pkg/errors:go_default_library",
        "//vendor/github.com/sirupsen/logrus:go_default_library",
    ],
)

filegroup(
    name = "package-srcs",
    srcs = glob(["**"]),
    tags = ["automanaged"],
    visibility = ["//visibility:private"],
)

filegroup(
    name = "all-srcs",
    srcs = [":package-srcs"],
    tags = ["automanaged"],
    visibility = ["//visibility:public"],
)
