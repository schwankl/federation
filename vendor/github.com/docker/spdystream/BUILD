load("@io_bazel_rules_go//go:def.bzl", "go_library", "go_test")

go_library(
    name = "go_default_library",
    srcs = [
        "connection.go",
        "handlers.go",
        "priority.go",
        "stream.go",
        "utils.go",
    ],
    importpath = "github.com/docker/spdystream",
    visibility = ["//visibility:public"],
    deps = ["//vendor/github.com/docker/spdystream/spdy:go_default_library"],
)

go_test(
    name = "go_default_test",
    srcs = [
        "priority_test.go",
        "spdy_bench_test.go",
        "spdy_test.go",
    ],
    importpath = "github.com/docker/spdystream",
    library = ":go_default_library",
    deps = ["//vendor/github.com/docker/spdystream/spdy:go_default_library"],
)

filegroup(
    name = "package-srcs",
    srcs = glob(["**"]),
    tags = ["automanaged"],
    visibility = ["//visibility:private"],
)

filegroup(
    name = "all-srcs",
    srcs = [
        ":package-srcs",
        "//vendor/github.com/docker/spdystream/spdy:all-srcs",
        "//vendor/github.com/docker/spdystream/ws:all-srcs",
    ],
    tags = ["automanaged"],
    visibility = ["//visibility:public"],
)
