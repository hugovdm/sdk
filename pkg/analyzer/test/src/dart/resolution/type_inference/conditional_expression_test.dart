// Copyright (c) 2019, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:analyzer/dart/analysis/features.dart';
import 'package:analyzer/src/generated/engine.dart';
import 'package:test_reflective_loader/test_reflective_loader.dart';

import '../driver_resolution.dart';

main() {
  defineReflectiveSuite(() {
    defineReflectiveTests(ConditionalExpressionTest);
    defineReflectiveTests(ConditionalExpressionWithNnbdTest);
  });
}

@reflectiveTest
class ConditionalExpressionTest extends DriverResolutionTest {
  test_upward() async {
    addTestFile('''
void f(bool a, int b, int c) {
  var d = a ? b : c;
  print(d);
}
''');
    await resolveTestFile();
    assertType(findNode.simple('d)'), 'int');
  }
}

@reflectiveTest
class ConditionalExpressionWithNnbdTest extends ConditionalExpressionTest {
  @override
  AnalysisOptionsImpl get analysisOptions => AnalysisOptionsImpl()
    ..contextFeatures = new FeatureSet.forTesting(
        sdkVersion: '2.3.0', additionalFeatures: [Feature.non_nullable]);

  @override
  bool get typeToStringWithNullability => true;

  @failingTest
  test_downward() async {
    addTestFile('''
void f(int b, int c) {
  var d = a() ? b : c;
  print(d);
}
T a<T>() => throw '';
''');
    await resolveTestFile();
    assertInvokeType(findNode.methodInvocation('d)'), 'bool Function()');
  }
}
