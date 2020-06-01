load("@rules_jvm_external//:specs.bzl", "maven")

def nullaway_workspace():
    return [
        maven.artifact(
            group = "com.uber.nullaway",
            artifact = "nullaway",
            version = "0.7.10",
        ),
        maven.artifact(
            group = "com.google.guava",
            artifact = "guava",
            version = "22.0",
        ),
    ]