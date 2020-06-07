load("@bazel_skylib//:bzl_library.bzl", "bzl_library")

exports_files([
    "rules.bzl",
    "workspace.bzl",
])

bzl_library(
    name = "junit5-rules",
    srcs = ["rules.bzl", "workspace.bzl"],
    visibility = ["//visibility:public"],
)
