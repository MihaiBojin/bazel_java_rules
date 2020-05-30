load("@rules_jvm_external//:defs.bzl", "artifact")

java_library(
    name = "hamcrest",
    testonly = True,
    visibility = ["//java:__subpackages__"],
    exports = [
        artifact("org.hamcrest:hamcrest-library"),
        artifact("org.hamcrest:hamcrest-core"),
        artifact("org.hamcrest:hamcrest"),
    ],
)
