exports_files([
    "rules.bzl",
    "workspace.bzl",
])

load("@bazel_skylib//:bzl_library.bzl", "bzl_library")
bzl_library(
    name = "google-java-format-rules",
    srcs = ["rules.bzl", "workspace.bzl"],
    visibility = ["//visibility:public"],
)
