// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/*class: M:OutputUnit(1, {lib})*/
class M {}

typedef dynamic FF({M b});

/*strong.member: table:OutputUnit(1, {lib})*/
const table =
/*strong.OutputUnit(1, {lib})*/
    const <int, FF>{1: f1, 2: f2};

/*member: f1:OutputUnit(1, {lib})*/
dynamic f1({M b}) => null;

/*member: f2:OutputUnit(1, {lib})*/
dynamic f2({M b}) => null;
