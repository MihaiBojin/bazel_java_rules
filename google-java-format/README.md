# Howto

## WORKSPACE

Add the library to your workspace:

```
load("@com_github_mihaibojin_bazel_java_rules//google-java-format:workspace.bzl", "google_java_format_workspace")
google_java_format_workspace()
```


## BUILD

Define the following targets in your project's root BUILD file:

```
load("@com_github_mihaibojin_bazel_java_rules//google-java-format:rules.bzl", "java_format")
java_format(
    name = "google-java-format-check",
    dry_run = True,
)
java_format(
    name = "google-java-format",
    dry_run = False,
    replace = True,
    set_exit_if_changed = False,
)
```

## Format

```
# Format all your JAVA code
bazel run //:google-java-format

# Ensure all your code is formatted
bazel run //:google-java-format-check
```
