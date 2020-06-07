load("@bazel_skylib//:bzl_library.bzl", "bzl_library")

exports_files([
    "rules.bzl",
    "workspace.bzl",
    "runner.bash.template",
])

bzl_library(
    name = "google-java-format-rules",
    srcs = ["rules.bzl", "workspace.bzl"],
    visibility = ["//visibility:public"],
)
