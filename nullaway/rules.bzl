def define_nullaway_plugin():
    java_plugin(
        name = "nullaway",
        deps = [
            artifact("com.uber.nullaway:nullaway"),
            artifact("com.google.guava:guava"),
        ],
    )
