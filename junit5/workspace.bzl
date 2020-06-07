load("@rules_jvm_external//:specs.bzl", "maven")

def junit5_workspace():
    """Defines the JUNIT5 dependencies to be loaded with maven_install"""
    return [
        maven.artifact(
            group = "org.hamcrest",
            artifact = "hamcrest-library",
            version = "2.2",
            testonly = True,
        ),
        maven.artifact(
            group = "org.hamcrest",
            artifact = "hamcrest-core",
            version = "2.2",
            testonly = True,
        ),
        maven.artifact(
            group = "org.hamcrest",
            artifact = "hamcrest",
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
    ]
