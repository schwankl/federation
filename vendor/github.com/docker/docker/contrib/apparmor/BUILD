load("@io_bazel_rules_go//go:def.bzl", "go_binary", "go_library")

go_library(
    name = "go_default_library",
    srcs = [
        "main.go",
        "template.go",
    ],
    importpath = "github.com/docker/docker/contrib/apparmor",
    visibility = ["//visibility:private"],
    deps = ["//vendor/github.com/docker/docker/pkg/aaparser:go_default_library"],
)

go_binary(
    name = "apparmor",
    importpath = "github.com/docker/docker/contrib/apparmor",
    library = ":go_default_library",
    visibility = ["//visibility:public"],
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
