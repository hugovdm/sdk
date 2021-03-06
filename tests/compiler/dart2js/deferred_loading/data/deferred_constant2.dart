// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:expect/expect.dart';

import '../libs/deferred_constant2_lib.dart' deferred as lib;

/*strong.member: main:OutputUnit(main, {})*/
/*strongConst.member: main:
 OutputUnit(main, {}),
 constants=[
  ConstructedConstant(Constant(value=IntConstant(499)))=OutputUnit(1, {lib})]
*/
main() {
  lib.loadLibrary().then(/*OutputUnit(main, {})*/ (_) {
    Expect.equals(499, lib.C1.value);
  });
}
