// REQUIRES: rdar23506925
// RUN: not %swift -Xcc -fake-argument -parse %s 2>&1 | FileCheck %s -check-prefix=CHECK-UNKNOWN-ARG
// CHECK-UNKNOWN-ARG: unknown argument: '-fake-argument'

// RUN: not %swift -Xcc -ivfsoverlay -Xcc %t.nonexistent -parse %s 2>&1 | FileCheck %s -check-prefix=CHECK-VFS-NONEXISTENT
// CHECK-VFS-NONEXISTENT: virtual filesystem overlay file '{{.*}}' not found

// RUN: not %swift -Xcc --version -parse %s 2>&1 | FileCheck %s -check-prefix=CHECK-DRIVER-OPTION
// CHECK-DRIVER-OPTION-DAG: LLVM version {{[0-9]+\.[0-9]+}}
// CHECK-DRIVER-OPTION-DAG: error: unable to handle compilation, expected exactly one compiler job
// CHECK-DRIVER-OPTION-DAG: error: clang importer creation failed
