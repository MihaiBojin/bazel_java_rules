load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")

def google_java_format_jar(version = "1.8", sha256 = "29c864e58db8784028f4871fa4ef1e9cfcc0e5b9939ead09c7f1fc59e64737be"):
    """Downloads the google-java-format JAR"""
    http_file(
        name = "google-java-format-jar",
        urls = [
            "https://github.com/google/google-java-format/releases/download/google-java-format-{version}/google-java-format-{version}-all-deps.jar".format(version = version),
        ],
        sha256 = sha256,
    )
