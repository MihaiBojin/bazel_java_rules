exports_files([
    "rules.bzl",
    "workspace.bzl",
    "runner.bash.template",
])

load("@bazel_skylib//:bzl_library.bzl", "bzl_library")
bzl_library(
    name = "google-java-format-rules",
    srcs = ["rules.bzl", "workspace.bzl"],
    visibility = ["//visibility:public"],
)
