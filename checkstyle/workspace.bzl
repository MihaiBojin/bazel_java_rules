load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")

def checkstyle_workspace():
    http_file(
        name = "checkstyle",
        sha256 = "5a46440e980a378d73e76c50ca554cd0c38480ac33040adf16d131d7e16d50a1",
        urls = [
            "https://github.com/checkstyle/checkstyle/releases/download/checkstyle-8.32/checkstyle-8.32-all.jar",
        ],
    )
