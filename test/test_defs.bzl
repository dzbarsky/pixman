load("@rules_cc//cc:defs.bzl", "cc_binary", "cc_test")

def pixman_tests(tests, progs):
    for test_name in tests:
        cc_test(
            name = test_name,
            srcs = [test_name + ".c"],
            defines = ["HAVE_CONFIG_H"],
            linkstatic = True,
            deps = [
                "//pixman:pixman",
                "//test/utils:testutils",
            ],
            timeout = "long",
        )

    for prog_name in progs:
        cc_binary(
            name = prog_name,
            srcs = [prog_name + ".c"],
            defines = ["HAVE_CONFIG_H"],
            linkstatic = True,
            deps = [
                "//pixman:pixman",
                "//test/utils:testutils",
            ],
        )
