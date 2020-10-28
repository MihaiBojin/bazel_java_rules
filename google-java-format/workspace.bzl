load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")

def google_java_format_jar(version = "1.9", sha256 = "1d98720a5984de85a822aa32a378eeacd4d17480d31cba6e730caae313466b97"):
    """Downloads the google-java-format JAR"""
    http_file(
        name = "google-java-format-jar",
        urls = [
            "https://github.com/google/google-java-format/releases/download/google-java-format-{version}/google-java-format-{version}-all-deps.jar".format(version = version),
        ],
        sha256 = sha256,
    )
