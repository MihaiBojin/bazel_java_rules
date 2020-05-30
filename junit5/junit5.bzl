load("@rules_jvm_external//:defs.bzl", "artifact")

# For more information see https://github.com/bmuschko/bazel-examples/blob/master/java/junit5-test/BUILD
# or https://github.com/salesforce/bazel-maven-proxy/tree/master/tools/junit5
def java_junit5_test(name, srcs, test_package, resources = [], deps = [], runtime_deps = [], **kwargs):
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
            artifact("org.junit.jupiter:junit-jupiter-api"),
            artifact("org.junit.jupiter:junit-jupiter-params"),
            artifact("org.junit.jupiter:junit-jupiter-engine"),
        ],
        resources = resources,
        runtime_deps = runtime_deps + [
            artifact("org.junit.platform:junit-platform-console"),
        ],
        **kwargs
    )
