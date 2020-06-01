def _javadoc(ctx):
    target_name = ctx.label.name
    output_jar = ctx.actions.declare_file("{}:{}-javadoc.jar".format(ctx.attr.group_id, ctx.attr.artifact_id))

    src_list = []
    for src in ctx.files.srcs:
        src_list += [src.path]

    # https://docs.oracle.com/en/java/javase/11/javadoc/javadoc-command.html#GUID-B0079316-8AA3-475B-8276-6A4095B5186A
    cmd = [
        "mkdir -p %s" % target_name,
        "javadoc -d %s %s" % (target_name, " ".join(src_list)),
        "jar cvf %s %s/*" % (output_jar.path, target_name),
    ]

    ctx.actions.run_shell(
        inputs = ctx.files.srcs,
        outputs = [output_jar],
        command = "\n".join(cmd),
        use_default_shell_env = True,
    )

    return [
        DefaultInfo(files = depset([output_jar])),
    ]

javadoc = rule(
    implementation = _javadoc,
    attrs = {
        "srcs": attr.label_list(allow_files = True),
        "group_id": attr.string(),
        "artifact_id": attr.string(),
    },
)
