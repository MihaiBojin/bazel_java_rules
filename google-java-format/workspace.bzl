load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")

def google_java_format_workspace(version, sha256):
    http_file(
        name = "google-java-format",
        urls = [
            "https://github.com/google/google-java-format/releases/download/google-java-format-{version}/google-java-format-{version}-all-deps.jar".format(version = "1.7"),
        ],
        sha256 = "0894ee02019ee8b4acd6df09fb50bac472e7199e1a5f041f8da58d08730694aa",
    )
