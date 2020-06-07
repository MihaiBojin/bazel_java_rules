load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")

def google_java_format_jar(version = "1.7", sha256 = "0894ee02019ee8b4acd6df09fb50bac472e7199e1a5f041f8da58d08730694aa"):
    """Downloads the google-java-format JAR"""
    http_file(
        name = "google-java-format-jar",
        urls = [
            "https://github.com/google/google-java-format/releases/download/google-java-format-{version}/google-java-format-{version}-all-deps.jar".format(version = version),
        ],
        sha256 = sha256,
    )
