load("@rules_jvm_external//:specs.bzl", "maven")

def errorprone_workspace():
    return [
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
   ]
