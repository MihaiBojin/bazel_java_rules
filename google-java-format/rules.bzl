load("@bazel_skylib//lib:shell.bzl", "shell")

# Adapted from this great example: https://github.com/bazelbuild/buildtools/blob/master/buildifier/def.bzl
def _java_format(ctx):
    # extract all files
    src_files = []
    for src in ctx.attr.srcs:
        src_files += src.files.to_list()

    # extract all paths
    src_list = []
    for src in src_files:
        src_list += [src.path]

    # Build the list of flags
    flags = []
    if ctx.attr.dry_run:
        flags.append("--dry-run")
    if ctx.attr.set_exit_if_changed:
        flags.append("--set-exit-if-changed")
    if ctx.attr.replace:
        flags.append("--replace")

    # populate the runner template and generate the runner bash script
    generated_runner_bash = ctx.actions.declare_file(ctx.label.name + ".bash")
    substitutions = {
        "@@FORMATTER_JAR@@": shell.quote(ctx.executable._formatter.short_path),
        "@@FLAGS@@": " ".join(flags),
        "@@SRCS@@": " ".join(src_list),
    }
    ctx.actions.expand_template(
        template = ctx.file._runner,
        output = generated_runner_bash,
        substitutions = substitutions,
        is_executable = True,
    )

    # instantiate the provider required to execute the rule
    return [DefaultInfo(
        files = depset([generated_runner_bash]),
        runfiles = ctx.runfiles(files = [ctx.executable._formatter]),
        executable = generated_runner_bash,
    )]


java_format = rule(
    implementation = _java_format,
    attrs = {
        "srcs": attr.label_list(
            allow_files = True,
            doc = "The files that will be checked"
        ),
        "dry_run": attr.bool(
            default = True,
            doc = "Prints the paths of the files whose contents would change if the formatter were run normally",
        ),
        "set_exit_if_changed": attr.bool(
            default = True,
            doc = "Return exit code 1 if there are any formatting changes",
        ),
        "replace": attr.bool(
            default = False,
            doc = "Send formatted output back to files, not stdout",
        ),
        "_formatter": attr.label(
            default = "@google-java-format-jar//file",
            executable = True,
            cfg = "host",
        ),
        "_runner": attr.label(
            default = "@com_github_mihaibojin_bazel_java_rules//google-java-format:runner.bash.template",
            allow_single_file = True,
        ),
    },
    executable = True,
)

# TODO(mihaibojin): Support all the flags
#  --assume-filename, -assume-filename
#    File name to use for diagnostics when formatting standard input (default is <stdin>).
#  --aosp, -aosp, -a
#    Use AOSP style instead of Google Style (4-space indentation).
#  --fix-imports-only
#    Fix import order and remove any unused imports, but do no other formatting.
#  --skip-sorting-imports
#    Do not fix the import order. Unused imports will still be removed.
#  --skip-removing-unused-imports
#    Do not remove unused imports. Imports will still be sorted.
#  --length, -length
#    Character length to format.
#  --lines, -lines, --line, -line
#    Line range(s) to format, like 5:10 (1-based; default is all).
#  --offset, -offset
#    Character offset to format (0-based; default is all).
#
# . --skip-reflowing-long-strings
#    Do not reflow string literals that exceed the column limit.
# . --skip-javadoc-formatting
#    Do not reformat javadoc.

