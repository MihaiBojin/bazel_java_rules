load("@rules_jvm_external//:defs.bzl", "artifact")

def nullaway_plugin(name):
    """Defines a java_plugin, to be used for running Nullaway"""
    native.java_plugin(
        name = name,
        deps = [
            artifact("com.uber.nullaway:nullaway"),
            artifact("com.google.guava:guava"),
        ],
    )
