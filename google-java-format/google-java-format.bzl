def java_format(name, srcs, dry_run = False, **kwargs):
    native.genrule(
        name = name,
        srcs = srcs,
        tools = [
            "@google-java-format//file",
        ],
        cmd = " ".join([
            "(",
            "echo;",
            "echo 'Files with formatting issues:';",
            "java -jar $(location @google-java-format//file)",
            "--set-exit-if-changed",
            "-n" if dry_run else "-i",
            "$(SRCS)",
            ")",
            "| tee \"$@\"",
        ]),
        outs = [
            name + ".log",
        ],
        **kwargs
    )

# TODO(mihaibojin): refactor like https://github.com/bazelbuild/buildtools/blob/master/buildifier/def.bzl
# using https://github.com/bazelbuild/buildtools/blob/master/buildifier/runner.bash.template
