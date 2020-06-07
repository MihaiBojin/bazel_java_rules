exports_files([
    "checkstyle.xml",
    "checkstyle-suppressions.xml",
    "checkstyle-xpath-suppressions.xml",
    "license-header.txt",
    "rules.bzl",
    "workspace.bzl",
])

load("@bazel_skylib//:bzl_library.bzl", "bzl_library")
bzl_library(
    name = "checkstyle-rules",
    srcs = ["rules.bzl", "workspace.bzl"],
    visibility = ["//visibility:public"],
)
