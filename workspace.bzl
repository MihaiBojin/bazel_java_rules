
maven_install(
    artifacts = [
        maven.artifact(
            group = "com.google.code.findbugs",
            artifact = "jsr305",
            version = "3.0.2",
            neverlink = True,
        ),
        maven.artifact(
            group = "com.google.errorprone",
            artifact = "error_prone_annotations",
            version = "2.3.4",
            neverlink = True,
        ),
        maven.artifact(
            group = "org.hamcrest",
            artifact = "hamcrest-library",
            version = "2.2",
            testonly = True,
        ),
        maven.artifact(
            group = "org.mockito",
            artifact = "mockito-core",
            version = "3.3.3",
            testonly = True,
        ),
        maven.artifact(
            group = "org.junit.jupiter",
            artifact = "junit-jupiter-api",
            version = "5.6.2",
            testonly = True,
        ),
        maven.artifact(
            group = "org.junit.jupiter",
            artifact = "junit-jupiter-params",
            version = "5.6.2",
            testonly = True,
        ),
        maven.artifact(
            group = "org.junit.jupiter",
            artifact = "junit-jupiter-engine",
            version = "5.6.2",
            testonly = True,
        ),
        maven.artifact(
            group = "org.junit.platform",
            artifact = "junit-platform-console",
            version = "1.6.2",
            testonly = True,
        ),
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
    ],
    fetch_sources = True,
    repositories = [
        "https://repo1.maven.org/maven2",
    ],
)
# END java dependencies
