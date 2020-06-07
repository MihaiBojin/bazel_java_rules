def checkstyle(name, srcs=[],
               checkstyle_xml="@com_github_mihaibojin_bazel_java_rules//checkstyle:checkstyle.xml",
               checkstyle_suppressions="@com_github_mihaibojin_bazel_java_rules//checkstyle:checkstyle-suppressions.xml",
               checkstyle_xpath_suppressions="@com_github_mihaibojin_bazel_java_rules//checkstyle:checkstyle-xpath-suppressions.xml",
               license_header="@com_github_mihaibojin_bazel_java_rules//checkstyle:license-header.txt"):
    """Runs Checkstyle over the specified source files.

    This rule runs [Checkstyle](https://github.com/checkstyle/checkstyle) on
    a given set of source files. Use `bazel build` to run the check.

    Args:
        name: A unique name for this rule.
        srcs: Source files to run Checkstyle against.

          Note that the Bazel glob() function can be used to specify which source
          files to include and which to exclude.
        license_header_file: Path to a file which holds a license header; the rule will verify
                             that all source files contain it.
        visibility: The visibility of this rule.
    """

    native.genrule(
        name = name,
        srcs = srcs,
        outs = ["checkstyle.log"],
        cmd = " ".join([
            "java -classpath $(location @checkstyle//file)",
            "-Dorg.checkstyle.google.header.file=$(location " + license_header + ")",
            "com.puppycrawl.tools.checkstyle.Main",
            "-c $(location " + checkstyle_xml + ")",
            "--",
            "$(SRCS)",
            "| tee \"$@\"",
        ]),
        tools = [
            checkstyle_xml,
            checkstyle_suppressions,
            checkstyle_xpath_suppressions,
            license_header,
            "@checkstyle//file",
        ],
    )
