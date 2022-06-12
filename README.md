# Diff Benchmark

This benchmark aims to compare different diff implementations (which currently are based on the Myers diff algorithm).

To execute the benchmarks, go to java-difflib-benchmark/ for Java (io.github.java-diff-utils)  and unix/ for the unix diff tool. The results show, that the current Java implementation is way slower for big line counts.

The base of the benchmarks are two enhanced execution traces from an analysis of Apache Commons IO.
