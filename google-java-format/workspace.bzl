load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")

def google_java_format_deps(version, sha256):
    http_file(
        name = "google-java-format",
        urls = [
            "https://github.com/google/google-java-format/releases/download/google-java-format-{version}/google-java-format-{version}-all-deps.jar".format(version = version),
        ],
        sha256 = sha256,
    )
