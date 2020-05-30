exports_files([
    "checkstyle.xml",
    "checkstyle-suppressions.xml",
    "checkstyle-xpath-suppressions.xml",
])

def run_checkstyle(license_header_file=None):
    genrule(
        name = "checkstyle",
        srcs = glob(["java/**/*.java"]),
        outs = ["checkstyle.log"],
        cmd = " ".join([
            "java -classpath $(location @checkstyle//file)",
            "com.puppycrawl.tools.checkstyle.Main",
            "-c $(location //java/third_party/checkstyle:checkstyle.xml)",
            "--",
            "$(SRCS)",
            "| tee \"$@\"",
        ]),
        tools = [
            "//java/third_party/checkstyle:checkstyle.xml",
            "//java/third_party/checkstyle:checkstyle-suppressions.xml",
            "//java/third_party/checkstyle:checkstyle-xpath-suppressions.xml",
            license_header_file,
            "@checkstyle//file",
        ],
    )