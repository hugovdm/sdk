// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import "package:expect/expect.dart";

void main() {
  final f1 = () => throw null;
  final f2 = () => null;
  Expect.equals(f1.runtimeType, f2.runtimeType);

  final Bottom = (<F>(F Function() f) => F)(() => throw null);
  Expect.equals(Null, Bottom);
}
