```
load("@bazel_java_rules/nullaway:rules.bzl", "define_nullaway_plugin")
define_nullaway_plugin()

java_library(
    javacopts = [
        "-Xep:NullAway:ERROR",
        "-XepOpt:NullAway:AnnotatedPackages=com.example",
    ],
    plugins = ["nullaway"],
    ...
```
