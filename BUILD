load("@io_bazel_stardoc//stardoc:stardoc.bzl", "stardoc")

exports_files(["LICENSE", "NOTICE"])

package(default_visibility = ["//visibility:public"])

stardoc(
    name = "bazel_java_rules_docs",
    input = "doc_hub.bzl",
    out = "DOCS.md",
    symbol_names = [
        "checkstyle-rules",
        "errorprone-rules",
        "google-java-format-rules",
        "javadoc-rules",
        "junit5-rules",
        "nullaway-rules",
    ],
    deps = [
        "//checkstyle:checkstyle-rules",
        "//errorprone:errorprone-rules",
        "//google-java-format:google-java-format-rules",
        "//javadoc:javadoc-rules",
        "//junit5:junit5-rules",
        "//nullaway:nullaway-rules",
    ]
)
