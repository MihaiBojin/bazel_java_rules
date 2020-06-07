#load("@rules_jvm_external//:defs.bzl", "artifact")

# For more information see
# - https://github.com/bmuschko/bazel-examples/blob/master/java/junit5-test/BUILD
# - https://github.com/salesforce/bazel-maven-proxy/tree/master/tools/junit5
# - https://github.com/junit-team/junit5-samples/tree/master/junit5-jupiter-starter-bazel
def junit5_test(name, srcs, test_package, resources = [], deps = [], runtime_deps = [], **kwargs):
    """JUnit runner macro"""
    FILTER_KWARGS = [
        "main_class",
        "use_testrunner",
        "args",
    ]

    for arg in FILTER_KWARGS:
        if arg in kwargs.keys():
            kwargs.pop(arg)

    junit_console_args = []
    if test_package:
        junit_console_args += ["--select-package", test_package]
    else:
        fail("must specify 'test_package'")

    native.java_test(
        name = name,
        srcs = srcs,
        use_testrunner = False,
        main_class = "org.junit.platform.console.ConsoleLauncher",
        args = junit_console_args,
        deps = deps + [
            "org.junit.jupiter:junit-jupiter-api",
            "org.junit.jupiter:junit-jupiter-params",
            "org.junit.jupiter:junit-jupiter-engine",
            "org.hamcrest:hamcrest-library",
            "org.hamcrest:hamcrest-core",
            "org.hamcrest:hamcrest",
            "org.mockito:mockito-core",
        ],
        visibility = ["//java:__subpackages__"],
        resources = resources,
        runtime_deps = runtime_deps + [
            "org.junit.platform:junit-platform-console",
        ],
        **kwargs
    )
