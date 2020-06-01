```
load("@bazel_java_rules/junit5:rules.bzl", "junit5_test")
junit5_test(
    name = "MyTests",
    srcs = glob(["**/*.java"]),
    resources = glob(["resources/**"]),
    test_package = "com.mihaibojin",
    deps = [
        "//source/code"
    ],
    runtime_deps = [...],
)
```