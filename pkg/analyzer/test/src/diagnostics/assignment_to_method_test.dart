// Copyright (c) 2019, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:analyzer/src/error/codes.dart';
import 'package:test_reflective_loader/test_reflective_loader.dart';

import '../dart/resolution/driver_resolution.dart';

main() {
  defineReflectiveSuite(() {
    defineReflectiveTests(AssignmentToMethodTest);
  });
}

@reflectiveTest
class AssignmentToMethodTest extends DriverResolutionTest {
  test_method() async {
    await assertErrorsInCode('''
class A {
  m() {}
}
f(A a) {
  a.m = () {};
}''', [
      error(StaticWarningCode.ASSIGNMENT_TO_METHOD, 32, 3),
    ]);
  }
}
