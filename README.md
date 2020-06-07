# About

Common Bazel Rules for JAVA.

Avoids duplication of common JAVA repository rules.


# Quick start

1\. Follow the installation instructions from the
[rules_jvm_external](https://github.com/bazelbuild/rules_jvm_external#usage) project.

2\. Add `bazel_java_rules` to your WORKSPACE

```
git_repository(
    name = "bazel_java_rules",
    commit = "...",
    remote = "https://github.com/MihaiBojin/bazel_java_rules",
)

```
3\. Configure the workspace with the desired rules, e.g.:

```
# Load the desired tools 
load("@com_github_mihaibojin_bazel_java_rules//google-java-format:workspace.bzl", "google_java_format_jar")
google_java_format_jar()

load("@com_github_mihaibojin_bazel_java_rules//checkstyle:workspace.bzl", "checkstyle_jar")
checkstyle_jar()

# And load the necessary dependencies via maven_install
load("@com_github_mihaibojin_bazel_java_rules//errorprone:workspace.bzl", "errorprone_workspace")
load("@com_github_mihaibojin_bazel_java_rules//nullaway:workspace.bzl", "nullaway_workspace")
load("@com_github_mihaibojin_bazel_java_rules//junit5:workspace.bzl", "junit5_workspace")

# BEGIN java dependencies
load("@rules_jvm_external//:specs.bzl", "maven")
maven_install(
    artifacts =
        [...] +
        errorprone_workspace() +
        nullaway_workspace() +
        junit5_workspace(),
    fetch_sources = True,
    strict_visibility = True,
    repositories = [
        "https://repo1.maven.org/maven2",
    ],
)
# END java dependencies
```

4\. Finally, call the desired rules in your BUILD targets, e.g.

```
load("@bazel_java_rules/errorprone:rules.bzl", "java_format")
java_format(
    name = "google-java-format",
    srcs = glob(["java/**/*.java"]),
)
```


# License

Copyright 2020 Mihai Bojin

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
