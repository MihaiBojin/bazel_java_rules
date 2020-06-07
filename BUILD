load("@io_bazel_stardoc//stardoc:stardoc.bzl", "stardoc")

exports_files(["LICENSE", "NOTICE"])

package(default_visibility = ["//visibility:public"])

stardoc(
    name = "docs",
    input = "doc_hub.bzl",
    out = "DOCS.md",
    symbol_names = [
        "checkstyle",
        "checkstyle_jar",
        "errorprone_workspace",
        "java_format",
        "google_java_format_jar",
        "javadoc",
        "junit5_test",
        "junit5_workspace",
        "nullaway_plugin",
        "nullaway_workspace",
    ],
    deps = [
        "//checkstyle:checkstyle-rules",
        "//errorprone:errorprone-rules",
#        "//google-java-format:google-java-format-rules",
        "//javadoc:javadoc-rules",
        "//junit5:junit5-rules",
        "//nullaway:nullaway-rules",
#        "@bazel_skylib//lib:shell",
        "@bazel_skylib//:bzl_library",
    ]
)
