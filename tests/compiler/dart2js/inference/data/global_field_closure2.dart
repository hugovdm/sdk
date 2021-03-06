// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/*member: method:[exact=JSUInt31]*/
// Called only via [foo] with a small integer.
method(/*[exact=JSUInt31]*/ a) {
  return a;
}

/*strong.member: foo:[null|subclass=Closure]*/
/*omit.member: foo:[null|subclass=Closure]*/
/*strongConst.member: foo:[subclass=Closure]*/
/*omitConst.member: foo:[subclass=Closure]*/
var foo = method;

/*member: returnInt:[null|subclass=Object]*/
returnInt() {
  return foo(54);
}

/*member: main:[null]*/
main() {
  returnInt();
}
