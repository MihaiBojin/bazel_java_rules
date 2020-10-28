# Howto

## WORKSPACE

Add the library to your workspace:

```
load("@com_github_mihaibojin_bazel_java_rules//google-java-format:workspace.bzl", "google_java_format_jar")
google_java_format_jar()
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

# Updating the library/formatter

1. Go to _google-java-format_'s [releases page](https://github.com/google/google-java-format/tags)

2. Download the most recent `all-deps` file

3. Compute a new shasum, e.g.:

```
shasum -a 256 ~/Downloads/google-java-format-1.9-all-deps.jar
1d98720a5984de85a822aa32a378eeacd4d17480d31cba6e730caae313466b97  google-java-format-1.9-all-deps.jar
```

4. Update [workspace.bzl](./workspace.bzl) and set the version and shasum
