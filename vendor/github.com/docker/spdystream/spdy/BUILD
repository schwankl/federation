load("@io_bazel_rules_go//go:def.bzl", "go_library", "go_test")

go_library(
    name = "go_default_library",
    srcs = [
        "dictionary.go",
        "read.go",
        "types.go",
        "write.go",
    ],
    importpath = "github.com/docker/spdystream/spdy",
    visibility = ["//visibility:public"],
)

go_test(
    name = "go_default_test",
    srcs = ["spdy_test.go"],
    importpath = "github.com/docker/spdystream/spdy",
    library = ":go_default_library",
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
