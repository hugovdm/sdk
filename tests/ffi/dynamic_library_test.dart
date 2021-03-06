// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.
//
// Dart test program for testing dart:ffi dynamic library loading.
//
// SharedObjects=ffi_test_dynamic_library ffi_test_functions

library FfiTest;

import 'dart:ffi';

import 'dylib_utils.dart';

import 'package:expect/expect.dart';

void main() {
  testOpen();
  testOpenError();
  testLookup();
  testLookupError();
  testToString();
  testEquality();
  testHandle();
}

void testOpen() {
  DynamicLibrary l = dlopenPlatformSpecific("ffi_test_dynamic_library");
  Expect.notEquals(null, l);
}

void testOpenError() {
  Expect.throws(
      () => dlopenPlatformSpecific("doesnotexistforsurelibrary123409876"));
}

typedef NativeDoubleUnOp = Double Function(Double);

typedef DoubleUnOp = double Function(double);

void testLookup() {
  DynamicLibrary l = dlopenPlatformSpecific("ffi_test_dynamic_library");
  var timesFour = l.lookupFunction<NativeDoubleUnOp, DoubleUnOp>("timesFour");
  Expect.approxEquals(12.0, timesFour(3));
}

void testLookupError() {
  DynamicLibrary l = dlopenPlatformSpecific("ffi_test_dynamic_library");
  Expect.throws(() => l.lookupFunction<NativeDoubleUnOp, DoubleUnOp>(
      "functionnamethatdoesnotexistforsure749237593845"));
}

void testToString() {
  DynamicLibrary l = dlopenPlatformSpecific("ffi_test_dynamic_library");
  Expect.stringEquals(
      "DynamicLibrary: handle=0x", l.toString().substring(0, 25));
}

void testEquality() {
  DynamicLibrary l = dlopenPlatformSpecific("ffi_test_dynamic_library");
  DynamicLibrary l2 = dlopenPlatformSpecific("ffi_test_dynamic_library");
  Expect.equals(l, l2);
  Expect.equals(l.hashCode, l2.hashCode);
  Expect.notEquals(l, null);
  Expect.notEquals(null, l);
  DynamicLibrary l3 = dlopenPlatformSpecific("ffi_test_functions");
  Expect.notEquals(l, l3);
}

void testHandle() {
  DynamicLibrary l = dlopenPlatformSpecific("ffi_test_dynamic_library");
  DynamicLibrary l2 = dlopenPlatformSpecific("ffi_test_dynamic_library");
  Pointer<Void> h = l.handle;
  Pointer<Void> h2 = l2.handle;
  Expect.equals(h, h2);
  DynamicLibrary l3 = dlopenPlatformSpecific("ffi_test_functions");
  Pointer<Void> h3 = l3.handle;
  Expect.notEquals(h, h3);
}
