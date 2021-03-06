// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// Class that represents Dart library methods.
///
/// The invididual lists are organized by return type.
/// The proto string has the following format:
///    +-------> receiver type (V denotes none)
///    |+------> param1 type  (V denotes none, v denotes getter)
///    ||+-----> param2 type
///    |||+----> ..
///    ||||
///   'TTTT..'
/// where:
///   V void
///   v void (special)
///   B bool
///   I int
///   i int (small)
///   D double
///   S String
///   s String (small)
///   L List<int>
///   X Set<int>
///   M Map<int, String>
///
/// NOTE: this code has been generated automatically.
///
class DartLib {
  final String name;
  final String proto;
  const DartLib(this.name, this.proto);

  static const boolLibs = [
    DartLib('bool.fromEnvironment', 'VS'),
    DartLib('isEven', 'Iv'),
    DartLib('isOdd', 'Iv'),
    DartLib('isEmpty', 'Mv'),
    DartLib('isNotEmpty', 'Mv'),
    DartLib('isNaN', 'Dv'),
    DartLib('isNegative', 'Dv'),
    DartLib('isInfinite', 'Dv'),
    DartLib('isFinite', 'Dv'),
    DartLib('add', 'XI'),
    DartLib('endsWith', 'SS'),
    DartLib('isEmpty', 'Sv'),
    DartLib('isNotEmpty', 'Sv'),
    DartLib('FileSystemEntity.identicalSync', 'VSS'),
    DartLib('FileSystemEntity.isLinkSync', 'VS'),
    DartLib('FileSystemEntity.isFileSync', 'VS'),
    DartLib('FileSystemEntity.isDirectorySync', 'VS'),
    DartLib('FileSystemEntity.isWatchSupported', 'Vv'),
    DartLib('SecurityContext.alpnSupported', 'Vv'),
    DartLib('NetworkInterface.listSupported', 'Vv'),
  ];
  static const intLibs = [
    DartLib('JsonUtf8Encoder.DEFAULT_BUFFER_SIZE', 'Vv'),
    DartLib('unicodeReplacementCharacterRune', 'Vv'),
    DartLib('unicodeBomCharacterRune', 'Vv'),
    DartLib('DateTime.monday', 'Vv'),
    DartLib('DateTime.tuesday', 'Vv'),
    DartLib('DateTime.wednesday', 'Vv'),
    DartLib('DateTime.thursday', 'Vv'),
    DartLib('DateTime.friday', 'Vv'),
    DartLib('DateTime.saturday', 'Vv'),
    DartLib('DateTime.sunday', 'Vv'),
    DartLib('DateTime.daysPerWeek', 'Vv'),
    DartLib('DateTime.january', 'Vv'),
    DartLib('DateTime.february', 'Vv'),
    DartLib('DateTime.march', 'Vv'),
    DartLib('DateTime.april', 'Vv'),
    DartLib('DateTime.may', 'Vv'),
    DartLib('DateTime.june', 'Vv'),
    DartLib('DateTime.july', 'Vv'),
    DartLib('DateTime.august', 'Vv'),
    DartLib('DateTime.september', 'Vv'),
    DartLib('DateTime.october', 'Vv'),
    DartLib('DateTime.november', 'Vv'),
    DartLib('DateTime.december', 'Vv'),
    DartLib('DateTime.monthsPerYear', 'Vv'),
    DartLib('round', 'DV'),
    DartLib('floor', 'DV'),
    DartLib('ceil', 'DV'),
    DartLib('truncate', 'DV'),
    DartLib('Duration.microsecondsPerMillisecond', 'Vv'),
    DartLib('Duration.millisecondsPerSecond', 'Vv'),
    DartLib('Duration.secondsPerMinute', 'Vv'),
    DartLib('Duration.minutesPerHour', 'Vv'),
    DartLib('Duration.hoursPerDay', 'Vv'),
    DartLib('Duration.microsecondsPerSecond', 'Vv'),
    DartLib('Duration.microsecondsPerMinute', 'Vv'),
    DartLib('Duration.microsecondsPerHour', 'Vv'),
    DartLib('Duration.microsecondsPerDay', 'Vv'),
    DartLib('Duration.millisecondsPerMinute', 'Vv'),
    DartLib('Duration.millisecondsPerHour', 'Vv'),
    DartLib('Duration.millisecondsPerDay', 'Vv'),
    DartLib('Duration.secondsPerHour', 'Vv'),
    DartLib('Duration.secondsPerDay', 'Vv'),
    DartLib('Duration.minutesPerDay', 'Vv'),
    DartLib('RangeError.checkValidRange', 'VIIISSS'),
    DartLib('int.fromEnvironment', 'VS'),
    DartLib('modPow', 'III'),
    DartLib('modInverse', 'II'),
    DartLib('gcd', 'II'),
    DartLib('toUnsigned', 'II'),
    DartLib('toSigned', 'II'),
    DartLib('abs', 'IV'),
    DartLib('round', 'IV'),
    DartLib('floor', 'IV'),
    DartLib('ceil', 'IV'),
    DartLib('truncate', 'IV'),
    DartLib('int.parse', 'VS'),
    DartLib('int.tryParse', 'VS'),
    DartLib('bitLength', 'Iv'),
    DartLib('sign', 'Iv'),
    DartLib('indexOf', 'LII'),
    DartLib('lastIndexOf', 'LII'),
    DartLib('removeAt', 'LI'),
    DartLib('removeLast', 'LV'),
    DartLib('length', 'Lv'),
    DartLib('length', 'Mv'),
    DartLib('compareTo', 'DD'),
    DartLib('round', 'DV'),
    DartLib('floor', 'DV'),
    DartLib('ceil', 'DV'),
    DartLib('truncate', 'DV'),
    DartLib('toInt', 'DV'),
    DartLib('codeUnitAt', 'SI'),
    DartLib('compareTo', 'SS'),
    DartLib('length', 'Sv'),
    DartLib('OSError.noErrorCode', 'Vv'),
    DartLib('ZLibOption.minWindowBits', 'Vv'),
    DartLib('ZLibOption.MIN_WINDOW_BITS', 'Vv'),
    DartLib('ZLibOption.maxWindowBits', 'Vv'),
    DartLib('ZLibOption.MAX_WINDOW_BITS', 'Vv'),
    DartLib('ZLibOption.defaultWindowBits', 'Vv'),
    DartLib('ZLibOption.DEFAULT_WINDOW_BITS', 'Vv'),
    DartLib('ZLibOption.minLevel', 'Vv'),
    DartLib('ZLibOption.MIN_LEVEL', 'Vv'),
    DartLib('ZLibOption.maxLevel', 'Vv'),
    DartLib('ZLibOption.MAX_LEVEL', 'Vv'),
    DartLib('ZLibOption.defaultLevel', 'Vv'),
    DartLib('ZLibOption.DEFAULT_LEVEL', 'Vv'),
    DartLib('ZLibOption.minMemLevel', 'Vv'),
    DartLib('ZLibOption.MIN_MEM_LEVEL', 'Vv'),
    DartLib('ZLibOption.maxMemLevel', 'Vv'),
    DartLib('ZLibOption.MAX_MEM_LEVEL', 'Vv'),
    DartLib('ZLibOption.defaultMemLevel', 'Vv'),
    DartLib('ZLibOption.DEFAULT_MEM_LEVEL', 'Vv'),
    DartLib('ZLibOption.strategyFiltered', 'Vv'),
    DartLib('ZLibOption.STRATEGY_FILTERED', 'Vv'),
    DartLib('ZLibOption.strategyHuffmanOnly', 'Vv'),
    DartLib('ZLibOption.STRATEGY_HUFFMAN_ONLY', 'Vv'),
    DartLib('ZLibOption.strategyRle', 'Vv'),
    DartLib('ZLibOption.STRATEGY_RLE', 'Vv'),
    DartLib('ZLibOption.strategyFixed', 'Vv'),
    DartLib('ZLibOption.STRATEGY_FIXED', 'Vv'),
    DartLib('ZLibOption.strategyDefault', 'Vv'),
    DartLib('ZLibOption.STRATEGY_DEFAULT', 'Vv'),
    DartLib('FileSystemEvent.create', 'Vv'),
    DartLib('FileSystemEvent.CREATE', 'Vv'),
    DartLib('FileSystemEvent.modify', 'Vv'),
    DartLib('FileSystemEvent.MODIFY', 'Vv'),
    DartLib('FileSystemEvent.delete', 'Vv'),
    DartLib('FileSystemEvent.DELETE', 'Vv'),
    DartLib('FileSystemEvent.move', 'Vv'),
    DartLib('FileSystemEvent.MOVE', 'Vv'),
    DartLib('FileSystemEvent.all', 'Vv'),
    DartLib('FileSystemEvent.ALL', 'Vv'),
    DartLib('exitCode', 'Vv'),
    DartLib('RawSocketOption.levelSocket', 'Vv'),
    DartLib('RawSocketOption.levelIPv4', 'Vv'),
    DartLib('RawSocketOption.IPv4MulticastInterface', 'Vv'),
    DartLib('RawSocketOption.levelIPv6', 'Vv'),
    DartLib('RawSocketOption.IPv6MulticastInterface', 'Vv'),
    DartLib('RawSocketOption.levelTcp', 'Vv'),
    DartLib('RawSocketOption.levelUdp', 'Vv'),
    DartLib('Isolate.immediate', 'Vv'),
    DartLib('Isolate.beforeNextEvent', 'Vv'),
    DartLib('Int8List.bytesPerElement', 'Vv'),
    DartLib('Uint8List.bytesPerElement', 'Vv'),
    DartLib('Uint8ClampedList.bytesPerElement', 'Vv'),
    DartLib('Int16List.bytesPerElement', 'Vv'),
    DartLib('Uint16List.bytesPerElement', 'Vv'),
    DartLib('Int32List.bytesPerElement', 'Vv'),
    DartLib('Uint32List.bytesPerElement', 'Vv'),
    DartLib('Int64List.bytesPerElement', 'Vv'),
    DartLib('Uint64List.bytesPerElement', 'Vv'),
    DartLib('Float32List.bytesPerElement', 'Vv'),
    DartLib('Float64List.bytesPerElement', 'Vv'),
    DartLib('Float32x4List.bytesPerElement', 'Vv'),
    DartLib('Int32x4List.bytesPerElement', 'Vv'),
    DartLib('Float64x2List.bytesPerElement', 'Vv'),
    DartLib('Float32x4.xxxx', 'Vv'),
    DartLib('Float32x4.xxxy', 'Vv'),
    DartLib('Float32x4.xxxz', 'Vv'),
    DartLib('Float32x4.xxxw', 'Vv'),
    DartLib('Float32x4.xxyx', 'Vv'),
    DartLib('Float32x4.xxyy', 'Vv'),
    DartLib('Float32x4.xxyz', 'Vv'),
    DartLib('Float32x4.xxyw', 'Vv'),
    DartLib('Float32x4.xxzx', 'Vv'),
    DartLib('Float32x4.xxzy', 'Vv'),
    DartLib('Float32x4.xxzz', 'Vv'),
    DartLib('Float32x4.xxzw', 'Vv'),
    DartLib('Float32x4.xxwx', 'Vv'),
    DartLib('Float32x4.xxwy', 'Vv'),
    DartLib('Float32x4.xxwz', 'Vv'),
    DartLib('Float32x4.xxww', 'Vv'),
    DartLib('Float32x4.xyxx', 'Vv'),
    DartLib('Float32x4.xyxy', 'Vv'),
    DartLib('Float32x4.xyxz', 'Vv'),
    DartLib('Float32x4.xyxw', 'Vv'),
    DartLib('Float32x4.xyyx', 'Vv'),
    DartLib('Float32x4.xyyy', 'Vv'),
    DartLib('Float32x4.xyyz', 'Vv'),
    DartLib('Float32x4.xyyw', 'Vv'),
    DartLib('Float32x4.xyzx', 'Vv'),
    DartLib('Float32x4.xyzy', 'Vv'),
    DartLib('Float32x4.xyzz', 'Vv'),
    DartLib('Float32x4.xyzw', 'Vv'),
    DartLib('Float32x4.xywx', 'Vv'),
    DartLib('Float32x4.xywy', 'Vv'),
    DartLib('Float32x4.xywz', 'Vv'),
    DartLib('Float32x4.xyww', 'Vv'),
    DartLib('Float32x4.xzxx', 'Vv'),
    DartLib('Float32x4.xzxy', 'Vv'),
    DartLib('Float32x4.xzxz', 'Vv'),
    DartLib('Float32x4.xzxw', 'Vv'),
    DartLib('Float32x4.xzyx', 'Vv'),
    DartLib('Float32x4.xzyy', 'Vv'),
    DartLib('Float32x4.xzyz', 'Vv'),
    DartLib('Float32x4.xzyw', 'Vv'),
    DartLib('Float32x4.xzzx', 'Vv'),
    DartLib('Float32x4.xzzy', 'Vv'),
    DartLib('Float32x4.xzzz', 'Vv'),
    DartLib('Float32x4.xzzw', 'Vv'),
    DartLib('Float32x4.xzwx', 'Vv'),
    DartLib('Float32x4.xzwy', 'Vv'),
    DartLib('Float32x4.xzwz', 'Vv'),
    DartLib('Float32x4.xzww', 'Vv'),
    DartLib('Float32x4.xwxx', 'Vv'),
    DartLib('Float32x4.xwxy', 'Vv'),
    DartLib('Float32x4.xwxz', 'Vv'),
    DartLib('Float32x4.xwxw', 'Vv'),
    DartLib('Float32x4.xwyx', 'Vv'),
    DartLib('Float32x4.xwyy', 'Vv'),
    DartLib('Float32x4.xwyz', 'Vv'),
    DartLib('Float32x4.xwyw', 'Vv'),
    DartLib('Float32x4.xwzx', 'Vv'),
    DartLib('Float32x4.xwzy', 'Vv'),
    DartLib('Float32x4.xwzz', 'Vv'),
    DartLib('Float32x4.xwzw', 'Vv'),
    DartLib('Float32x4.xwwx', 'Vv'),
    DartLib('Float32x4.xwwy', 'Vv'),
    DartLib('Float32x4.xwwz', 'Vv'),
    DartLib('Float32x4.xwww', 'Vv'),
    DartLib('Float32x4.yxxx', 'Vv'),
    DartLib('Float32x4.yxxy', 'Vv'),
    DartLib('Float32x4.yxxz', 'Vv'),
    DartLib('Float32x4.yxxw', 'Vv'),
    DartLib('Float32x4.yxyx', 'Vv'),
    DartLib('Float32x4.yxyy', 'Vv'),
    DartLib('Float32x4.yxyz', 'Vv'),
    DartLib('Float32x4.yxyw', 'Vv'),
    DartLib('Float32x4.yxzx', 'Vv'),
    DartLib('Float32x4.yxzy', 'Vv'),
    DartLib('Float32x4.yxzz', 'Vv'),
    DartLib('Float32x4.yxzw', 'Vv'),
    DartLib('Float32x4.yxwx', 'Vv'),
    DartLib('Float32x4.yxwy', 'Vv'),
    DartLib('Float32x4.yxwz', 'Vv'),
    DartLib('Float32x4.yxww', 'Vv'),
    DartLib('Float32x4.yyxx', 'Vv'),
    DartLib('Float32x4.yyxy', 'Vv'),
    DartLib('Float32x4.yyxz', 'Vv'),
    DartLib('Float32x4.yyxw', 'Vv'),
    DartLib('Float32x4.yyyx', 'Vv'),
    DartLib('Float32x4.yyyy', 'Vv'),
    DartLib('Float32x4.yyyz', 'Vv'),
    DartLib('Float32x4.yyyw', 'Vv'),
    DartLib('Float32x4.yyzx', 'Vv'),
    DartLib('Float32x4.yyzy', 'Vv'),
    DartLib('Float32x4.yyzz', 'Vv'),
    DartLib('Float32x4.yyzw', 'Vv'),
    DartLib('Float32x4.yywx', 'Vv'),
    DartLib('Float32x4.yywy', 'Vv'),
    DartLib('Float32x4.yywz', 'Vv'),
    DartLib('Float32x4.yyww', 'Vv'),
    DartLib('Float32x4.yzxx', 'Vv'),
    DartLib('Float32x4.yzxy', 'Vv'),
    DartLib('Float32x4.yzxz', 'Vv'),
    DartLib('Float32x4.yzxw', 'Vv'),
    DartLib('Float32x4.yzyx', 'Vv'),
    DartLib('Float32x4.yzyy', 'Vv'),
    DartLib('Float32x4.yzyz', 'Vv'),
    DartLib('Float32x4.yzyw', 'Vv'),
    DartLib('Float32x4.yzzx', 'Vv'),
    DartLib('Float32x4.yzzy', 'Vv'),
    DartLib('Float32x4.yzzz', 'Vv'),
    DartLib('Float32x4.yzzw', 'Vv'),
    DartLib('Float32x4.yzwx', 'Vv'),
    DartLib('Float32x4.yzwy', 'Vv'),
    DartLib('Float32x4.yzwz', 'Vv'),
    DartLib('Float32x4.yzww', 'Vv'),
    DartLib('Float32x4.ywxx', 'Vv'),
    DartLib('Float32x4.ywxy', 'Vv'),
    DartLib('Float32x4.ywxz', 'Vv'),
    DartLib('Float32x4.ywxw', 'Vv'),
    DartLib('Float32x4.ywyx', 'Vv'),
    DartLib('Float32x4.ywyy', 'Vv'),
    DartLib('Float32x4.ywyz', 'Vv'),
    DartLib('Float32x4.ywyw', 'Vv'),
    DartLib('Float32x4.ywzx', 'Vv'),
    DartLib('Float32x4.ywzy', 'Vv'),
    DartLib('Float32x4.ywzz', 'Vv'),
    DartLib('Float32x4.ywzw', 'Vv'),
    DartLib('Float32x4.ywwx', 'Vv'),
    DartLib('Float32x4.ywwy', 'Vv'),
    DartLib('Float32x4.ywwz', 'Vv'),
    DartLib('Float32x4.ywww', 'Vv'),
    DartLib('Float32x4.zxxx', 'Vv'),
    DartLib('Float32x4.zxxy', 'Vv'),
    DartLib('Float32x4.zxxz', 'Vv'),
    DartLib('Float32x4.zxxw', 'Vv'),
    DartLib('Float32x4.zxyx', 'Vv'),
    DartLib('Float32x4.zxyy', 'Vv'),
    DartLib('Float32x4.zxyz', 'Vv'),
    DartLib('Float32x4.zxyw', 'Vv'),
    DartLib('Float32x4.zxzx', 'Vv'),
    DartLib('Float32x4.zxzy', 'Vv'),
    DartLib('Float32x4.zxzz', 'Vv'),
    DartLib('Float32x4.zxzw', 'Vv'),
    DartLib('Float32x4.zxwx', 'Vv'),
    DartLib('Float32x4.zxwy', 'Vv'),
    DartLib('Float32x4.zxwz', 'Vv'),
    DartLib('Float32x4.zxww', 'Vv'),
    DartLib('Float32x4.zyxx', 'Vv'),
    DartLib('Float32x4.zyxy', 'Vv'),
    DartLib('Float32x4.zyxz', 'Vv'),
    DartLib('Float32x4.zyxw', 'Vv'),
    DartLib('Float32x4.zyyx', 'Vv'),
    DartLib('Float32x4.zyyy', 'Vv'),
    DartLib('Float32x4.zyyz', 'Vv'),
    DartLib('Float32x4.zyyw', 'Vv'),
    DartLib('Float32x4.zyzx', 'Vv'),
    DartLib('Float32x4.zyzy', 'Vv'),
    DartLib('Float32x4.zyzz', 'Vv'),
    DartLib('Float32x4.zyzw', 'Vv'),
    DartLib('Float32x4.zywx', 'Vv'),
    DartLib('Float32x4.zywy', 'Vv'),
    DartLib('Float32x4.zywz', 'Vv'),
    DartLib('Float32x4.zyww', 'Vv'),
    DartLib('Float32x4.zzxx', 'Vv'),
    DartLib('Float32x4.zzxy', 'Vv'),
    DartLib('Float32x4.zzxz', 'Vv'),
    DartLib('Float32x4.zzxw', 'Vv'),
    DartLib('Float32x4.zzyx', 'Vv'),
    DartLib('Float32x4.zzyy', 'Vv'),
    DartLib('Float32x4.zzyz', 'Vv'),
    DartLib('Float32x4.zzyw', 'Vv'),
    DartLib('Float32x4.zzzx', 'Vv'),
    DartLib('Float32x4.zzzy', 'Vv'),
    DartLib('Float32x4.zzzz', 'Vv'),
    DartLib('Float32x4.zzzw', 'Vv'),
    DartLib('Float32x4.zzwx', 'Vv'),
    DartLib('Float32x4.zzwy', 'Vv'),
    DartLib('Float32x4.zzwz', 'Vv'),
    DartLib('Float32x4.zzww', 'Vv'),
    DartLib('Float32x4.zwxx', 'Vv'),
    DartLib('Float32x4.zwxy', 'Vv'),
    DartLib('Float32x4.zwxz', 'Vv'),
    DartLib('Float32x4.zwxw', 'Vv'),
    DartLib('Float32x4.zwyx', 'Vv'),
    DartLib('Float32x4.zwyy', 'Vv'),
    DartLib('Float32x4.zwyz', 'Vv'),
    DartLib('Float32x4.zwyw', 'Vv'),
    DartLib('Float32x4.zwzx', 'Vv'),
    DartLib('Float32x4.zwzy', 'Vv'),
    DartLib('Float32x4.zwzz', 'Vv'),
    DartLib('Float32x4.zwzw', 'Vv'),
    DartLib('Float32x4.zwwx', 'Vv'),
    DartLib('Float32x4.zwwy', 'Vv'),
    DartLib('Float32x4.zwwz', 'Vv'),
    DartLib('Float32x4.zwww', 'Vv'),
    DartLib('Float32x4.wxxx', 'Vv'),
    DartLib('Float32x4.wxxy', 'Vv'),
    DartLib('Float32x4.wxxz', 'Vv'),
    DartLib('Float32x4.wxxw', 'Vv'),
    DartLib('Float32x4.wxyx', 'Vv'),
    DartLib('Float32x4.wxyy', 'Vv'),
    DartLib('Float32x4.wxyz', 'Vv'),
    DartLib('Float32x4.wxyw', 'Vv'),
    DartLib('Float32x4.wxzx', 'Vv'),
    DartLib('Float32x4.wxzy', 'Vv'),
    DartLib('Float32x4.wxzz', 'Vv'),
    DartLib('Float32x4.wxzw', 'Vv'),
    DartLib('Float32x4.wxwx', 'Vv'),
    DartLib('Float32x4.wxwy', 'Vv'),
    DartLib('Float32x4.wxwz', 'Vv'),
    DartLib('Float32x4.wxww', 'Vv'),
    DartLib('Float32x4.wyxx', 'Vv'),
    DartLib('Float32x4.wyxy', 'Vv'),
    DartLib('Float32x4.wyxz', 'Vv'),
    DartLib('Float32x4.wyxw', 'Vv'),
    DartLib('Float32x4.wyyx', 'Vv'),
    DartLib('Float32x4.wyyy', 'Vv'),
    DartLib('Float32x4.wyyz', 'Vv'),
    DartLib('Float32x4.wyyw', 'Vv'),
    DartLib('Float32x4.wyzx', 'Vv'),
    DartLib('Float32x4.wyzy', 'Vv'),
    DartLib('Float32x4.wyzz', 'Vv'),
    DartLib('Float32x4.wyzw', 'Vv'),
    DartLib('Float32x4.wywx', 'Vv'),
    DartLib('Float32x4.wywy', 'Vv'),
    DartLib('Float32x4.wywz', 'Vv'),
    DartLib('Float32x4.wyww', 'Vv'),
    DartLib('Float32x4.wzxx', 'Vv'),
    DartLib('Float32x4.wzxy', 'Vv'),
    DartLib('Float32x4.wzxz', 'Vv'),
    DartLib('Float32x4.wzxw', 'Vv'),
    DartLib('Float32x4.wzyx', 'Vv'),
    DartLib('Float32x4.wzyy', 'Vv'),
    DartLib('Float32x4.wzyz', 'Vv'),
    DartLib('Float32x4.wzyw', 'Vv'),
    DartLib('Float32x4.wzzx', 'Vv'),
    DartLib('Float32x4.wzzy', 'Vv'),
    DartLib('Float32x4.wzzz', 'Vv'),
    DartLib('Float32x4.wzzw', 'Vv'),
    DartLib('Float32x4.wzwx', 'Vv'),
    DartLib('Float32x4.wzwy', 'Vv'),
    DartLib('Float32x4.wzwz', 'Vv'),
    DartLib('Float32x4.wzww', 'Vv'),
    DartLib('Float32x4.wwxx', 'Vv'),
    DartLib('Float32x4.wwxy', 'Vv'),
    DartLib('Float32x4.wwxz', 'Vv'),
    DartLib('Float32x4.wwxw', 'Vv'),
    DartLib('Float32x4.wwyx', 'Vv'),
    DartLib('Float32x4.wwyy', 'Vv'),
    DartLib('Float32x4.wwyz', 'Vv'),
    DartLib('Float32x4.wwyw', 'Vv'),
    DartLib('Float32x4.wwzx', 'Vv'),
    DartLib('Float32x4.wwzy', 'Vv'),
    DartLib('Float32x4.wwzz', 'Vv'),
    DartLib('Float32x4.wwzw', 'Vv'),
    DartLib('Float32x4.wwwx', 'Vv'),
    DartLib('Float32x4.wwwy', 'Vv'),
    DartLib('Float32x4.wwwz', 'Vv'),
    DartLib('Float32x4.wwww', 'Vv'),
    DartLib('Int32x4.xxxx', 'Vv'),
    DartLib('Int32x4.xxxy', 'Vv'),
    DartLib('Int32x4.xxxz', 'Vv'),
    DartLib('Int32x4.xxxw', 'Vv'),
    DartLib('Int32x4.xxyx', 'Vv'),
    DartLib('Int32x4.xxyy', 'Vv'),
    DartLib('Int32x4.xxyz', 'Vv'),
    DartLib('Int32x4.xxyw', 'Vv'),
    DartLib('Int32x4.xxzx', 'Vv'),
    DartLib('Int32x4.xxzy', 'Vv'),
    DartLib('Int32x4.xxzz', 'Vv'),
    DartLib('Int32x4.xxzw', 'Vv'),
    DartLib('Int32x4.xxwx', 'Vv'),
    DartLib('Int32x4.xxwy', 'Vv'),
    DartLib('Int32x4.xxwz', 'Vv'),
    DartLib('Int32x4.xxww', 'Vv'),
    DartLib('Int32x4.xyxx', 'Vv'),
    DartLib('Int32x4.xyxy', 'Vv'),
    DartLib('Int32x4.xyxz', 'Vv'),
    DartLib('Int32x4.xyxw', 'Vv'),
    DartLib('Int32x4.xyyx', 'Vv'),
    DartLib('Int32x4.xyyy', 'Vv'),
    DartLib('Int32x4.xyyz', 'Vv'),
    DartLib('Int32x4.xyyw', 'Vv'),
    DartLib('Int32x4.xyzx', 'Vv'),
    DartLib('Int32x4.xyzy', 'Vv'),
    DartLib('Int32x4.xyzz', 'Vv'),
    DartLib('Int32x4.xyzw', 'Vv'),
    DartLib('Int32x4.xywx', 'Vv'),
    DartLib('Int32x4.xywy', 'Vv'),
    DartLib('Int32x4.xywz', 'Vv'),
    DartLib('Int32x4.xyww', 'Vv'),
    DartLib('Int32x4.xzxx', 'Vv'),
    DartLib('Int32x4.xzxy', 'Vv'),
    DartLib('Int32x4.xzxz', 'Vv'),
    DartLib('Int32x4.xzxw', 'Vv'),
    DartLib('Int32x4.xzyx', 'Vv'),
    DartLib('Int32x4.xzyy', 'Vv'),
    DartLib('Int32x4.xzyz', 'Vv'),
    DartLib('Int32x4.xzyw', 'Vv'),
    DartLib('Int32x4.xzzx', 'Vv'),
    DartLib('Int32x4.xzzy', 'Vv'),
    DartLib('Int32x4.xzzz', 'Vv'),
    DartLib('Int32x4.xzzw', 'Vv'),
    DartLib('Int32x4.xzwx', 'Vv'),
    DartLib('Int32x4.xzwy', 'Vv'),
    DartLib('Int32x4.xzwz', 'Vv'),
    DartLib('Int32x4.xzww', 'Vv'),
    DartLib('Int32x4.xwxx', 'Vv'),
    DartLib('Int32x4.xwxy', 'Vv'),
    DartLib('Int32x4.xwxz', 'Vv'),
    DartLib('Int32x4.xwxw', 'Vv'),
    DartLib('Int32x4.xwyx', 'Vv'),
    DartLib('Int32x4.xwyy', 'Vv'),
    DartLib('Int32x4.xwyz', 'Vv'),
    DartLib('Int32x4.xwyw', 'Vv'),
    DartLib('Int32x4.xwzx', 'Vv'),
    DartLib('Int32x4.xwzy', 'Vv'),
    DartLib('Int32x4.xwzz', 'Vv'),
    DartLib('Int32x4.xwzw', 'Vv'),
    DartLib('Int32x4.xwwx', 'Vv'),
    DartLib('Int32x4.xwwy', 'Vv'),
    DartLib('Int32x4.xwwz', 'Vv'),
    DartLib('Int32x4.xwww', 'Vv'),
    DartLib('Int32x4.yxxx', 'Vv'),
    DartLib('Int32x4.yxxy', 'Vv'),
    DartLib('Int32x4.yxxz', 'Vv'),
    DartLib('Int32x4.yxxw', 'Vv'),
    DartLib('Int32x4.yxyx', 'Vv'),
    DartLib('Int32x4.yxyy', 'Vv'),
    DartLib('Int32x4.yxyz', 'Vv'),
    DartLib('Int32x4.yxyw', 'Vv'),
    DartLib('Int32x4.yxzx', 'Vv'),
    DartLib('Int32x4.yxzy', 'Vv'),
    DartLib('Int32x4.yxzz', 'Vv'),
    DartLib('Int32x4.yxzw', 'Vv'),
    DartLib('Int32x4.yxwx', 'Vv'),
    DartLib('Int32x4.yxwy', 'Vv'),
    DartLib('Int32x4.yxwz', 'Vv'),
    DartLib('Int32x4.yxww', 'Vv'),
    DartLib('Int32x4.yyxx', 'Vv'),
    DartLib('Int32x4.yyxy', 'Vv'),
    DartLib('Int32x4.yyxz', 'Vv'),
    DartLib('Int32x4.yyxw', 'Vv'),
    DartLib('Int32x4.yyyx', 'Vv'),
    DartLib('Int32x4.yyyy', 'Vv'),
    DartLib('Int32x4.yyyz', 'Vv'),
    DartLib('Int32x4.yyyw', 'Vv'),
    DartLib('Int32x4.yyzx', 'Vv'),
    DartLib('Int32x4.yyzy', 'Vv'),
    DartLib('Int32x4.yyzz', 'Vv'),
    DartLib('Int32x4.yyzw', 'Vv'),
    DartLib('Int32x4.yywx', 'Vv'),
    DartLib('Int32x4.yywy', 'Vv'),
    DartLib('Int32x4.yywz', 'Vv'),
    DartLib('Int32x4.yyww', 'Vv'),
    DartLib('Int32x4.yzxx', 'Vv'),
    DartLib('Int32x4.yzxy', 'Vv'),
    DartLib('Int32x4.yzxz', 'Vv'),
    DartLib('Int32x4.yzxw', 'Vv'),
    DartLib('Int32x4.yzyx', 'Vv'),
    DartLib('Int32x4.yzyy', 'Vv'),
    DartLib('Int32x4.yzyz', 'Vv'),
    DartLib('Int32x4.yzyw', 'Vv'),
    DartLib('Int32x4.yzzx', 'Vv'),
    DartLib('Int32x4.yzzy', 'Vv'),
    DartLib('Int32x4.yzzz', 'Vv'),
    DartLib('Int32x4.yzzw', 'Vv'),
    DartLib('Int32x4.yzwx', 'Vv'),
    DartLib('Int32x4.yzwy', 'Vv'),
    DartLib('Int32x4.yzwz', 'Vv'),
    DartLib('Int32x4.yzww', 'Vv'),
    DartLib('Int32x4.ywxx', 'Vv'),
    DartLib('Int32x4.ywxy', 'Vv'),
    DartLib('Int32x4.ywxz', 'Vv'),
    DartLib('Int32x4.ywxw', 'Vv'),
    DartLib('Int32x4.ywyx', 'Vv'),
    DartLib('Int32x4.ywyy', 'Vv'),
    DartLib('Int32x4.ywyz', 'Vv'),
    DartLib('Int32x4.ywyw', 'Vv'),
    DartLib('Int32x4.ywzx', 'Vv'),
    DartLib('Int32x4.ywzy', 'Vv'),
    DartLib('Int32x4.ywzz', 'Vv'),
    DartLib('Int32x4.ywzw', 'Vv'),
    DartLib('Int32x4.ywwx', 'Vv'),
    DartLib('Int32x4.ywwy', 'Vv'),
    DartLib('Int32x4.ywwz', 'Vv'),
    DartLib('Int32x4.ywww', 'Vv'),
    DartLib('Int32x4.zxxx', 'Vv'),
    DartLib('Int32x4.zxxy', 'Vv'),
    DartLib('Int32x4.zxxz', 'Vv'),
    DartLib('Int32x4.zxxw', 'Vv'),
    DartLib('Int32x4.zxyx', 'Vv'),
    DartLib('Int32x4.zxyy', 'Vv'),
    DartLib('Int32x4.zxyz', 'Vv'),
    DartLib('Int32x4.zxyw', 'Vv'),
    DartLib('Int32x4.zxzx', 'Vv'),
    DartLib('Int32x4.zxzy', 'Vv'),
    DartLib('Int32x4.zxzz', 'Vv'),
    DartLib('Int32x4.zxzw', 'Vv'),
    DartLib('Int32x4.zxwx', 'Vv'),
    DartLib('Int32x4.zxwy', 'Vv'),
    DartLib('Int32x4.zxwz', 'Vv'),
    DartLib('Int32x4.zxww', 'Vv'),
    DartLib('Int32x4.zyxx', 'Vv'),
    DartLib('Int32x4.zyxy', 'Vv'),
    DartLib('Int32x4.zyxz', 'Vv'),
    DartLib('Int32x4.zyxw', 'Vv'),
    DartLib('Int32x4.zyyx', 'Vv'),
    DartLib('Int32x4.zyyy', 'Vv'),
    DartLib('Int32x4.zyyz', 'Vv'),
    DartLib('Int32x4.zyyw', 'Vv'),
    DartLib('Int32x4.zyzx', 'Vv'),
    DartLib('Int32x4.zyzy', 'Vv'),
    DartLib('Int32x4.zyzz', 'Vv'),
    DartLib('Int32x4.zyzw', 'Vv'),
    DartLib('Int32x4.zywx', 'Vv'),
    DartLib('Int32x4.zywy', 'Vv'),
    DartLib('Int32x4.zywz', 'Vv'),
    DartLib('Int32x4.zyww', 'Vv'),
    DartLib('Int32x4.zzxx', 'Vv'),
    DartLib('Int32x4.zzxy', 'Vv'),
    DartLib('Int32x4.zzxz', 'Vv'),
    DartLib('Int32x4.zzxw', 'Vv'),
    DartLib('Int32x4.zzyx', 'Vv'),
    DartLib('Int32x4.zzyy', 'Vv'),
    DartLib('Int32x4.zzyz', 'Vv'),
    DartLib('Int32x4.zzyw', 'Vv'),
    DartLib('Int32x4.zzzx', 'Vv'),
    DartLib('Int32x4.zzzy', 'Vv'),
    DartLib('Int32x4.zzzz', 'Vv'),
    DartLib('Int32x4.zzzw', 'Vv'),
    DartLib('Int32x4.zzwx', 'Vv'),
    DartLib('Int32x4.zzwy', 'Vv'),
    DartLib('Int32x4.zzwz', 'Vv'),
    DartLib('Int32x4.zzww', 'Vv'),
    DartLib('Int32x4.zwxx', 'Vv'),
    DartLib('Int32x4.zwxy', 'Vv'),
    DartLib('Int32x4.zwxz', 'Vv'),
    DartLib('Int32x4.zwxw', 'Vv'),
    DartLib('Int32x4.zwyx', 'Vv'),
    DartLib('Int32x4.zwyy', 'Vv'),
    DartLib('Int32x4.zwyz', 'Vv'),
    DartLib('Int32x4.zwyw', 'Vv'),
    DartLib('Int32x4.zwzx', 'Vv'),
    DartLib('Int32x4.zwzy', 'Vv'),
    DartLib('Int32x4.zwzz', 'Vv'),
    DartLib('Int32x4.zwzw', 'Vv'),
    DartLib('Int32x4.zwwx', 'Vv'),
    DartLib('Int32x4.zwwy', 'Vv'),
    DartLib('Int32x4.zwwz', 'Vv'),
    DartLib('Int32x4.zwww', 'Vv'),
    DartLib('Int32x4.wxxx', 'Vv'),
    DartLib('Int32x4.wxxy', 'Vv'),
    DartLib('Int32x4.wxxz', 'Vv'),
    DartLib('Int32x4.wxxw', 'Vv'),
    DartLib('Int32x4.wxyx', 'Vv'),
    DartLib('Int32x4.wxyy', 'Vv'),
    DartLib('Int32x4.wxyz', 'Vv'),
    DartLib('Int32x4.wxyw', 'Vv'),
    DartLib('Int32x4.wxzx', 'Vv'),
    DartLib('Int32x4.wxzy', 'Vv'),
    DartLib('Int32x4.wxzz', 'Vv'),
    DartLib('Int32x4.wxzw', 'Vv'),
    DartLib('Int32x4.wxwx', 'Vv'),
    DartLib('Int32x4.wxwy', 'Vv'),
    DartLib('Int32x4.wxwz', 'Vv'),
    DartLib('Int32x4.wxww', 'Vv'),
    DartLib('Int32x4.wyxx', 'Vv'),
    DartLib('Int32x4.wyxy', 'Vv'),
    DartLib('Int32x4.wyxz', 'Vv'),
    DartLib('Int32x4.wyxw', 'Vv'),
    DartLib('Int32x4.wyyx', 'Vv'),
    DartLib('Int32x4.wyyy', 'Vv'),
    DartLib('Int32x4.wyyz', 'Vv'),
    DartLib('Int32x4.wyyw', 'Vv'),
    DartLib('Int32x4.wyzx', 'Vv'),
    DartLib('Int32x4.wyzy', 'Vv'),
    DartLib('Int32x4.wyzz', 'Vv'),
    DartLib('Int32x4.wyzw', 'Vv'),
    DartLib('Int32x4.wywx', 'Vv'),
    DartLib('Int32x4.wywy', 'Vv'),
    DartLib('Int32x4.wywz', 'Vv'),
    DartLib('Int32x4.wyww', 'Vv'),
    DartLib('Int32x4.wzxx', 'Vv'),
    DartLib('Int32x4.wzxy', 'Vv'),
    DartLib('Int32x4.wzxz', 'Vv'),
    DartLib('Int32x4.wzxw', 'Vv'),
    DartLib('Int32x4.wzyx', 'Vv'),
    DartLib('Int32x4.wzyy', 'Vv'),
    DartLib('Int32x4.wzyz', 'Vv'),
    DartLib('Int32x4.wzyw', 'Vv'),
    DartLib('Int32x4.wzzx', 'Vv'),
    DartLib('Int32x4.wzzy', 'Vv'),
    DartLib('Int32x4.wzzz', 'Vv'),
    DartLib('Int32x4.wzzw', 'Vv'),
    DartLib('Int32x4.wzwx', 'Vv'),
    DartLib('Int32x4.wzwy', 'Vv'),
    DartLib('Int32x4.wzwz', 'Vv'),
    DartLib('Int32x4.wzww', 'Vv'),
    DartLib('Int32x4.wwxx', 'Vv'),
    DartLib('Int32x4.wwxy', 'Vv'),
    DartLib('Int32x4.wwxz', 'Vv'),
    DartLib('Int32x4.wwxw', 'Vv'),
    DartLib('Int32x4.wwyx', 'Vv'),
    DartLib('Int32x4.wwyy', 'Vv'),
    DartLib('Int32x4.wwyz', 'Vv'),
    DartLib('Int32x4.wwyw', 'Vv'),
    DartLib('Int32x4.wwzx', 'Vv'),
    DartLib('Int32x4.wwzy', 'Vv'),
    DartLib('Int32x4.wwzz', 'Vv'),
    DartLib('Int32x4.wwzw', 'Vv'),
    DartLib('Int32x4.wwwx', 'Vv'),
    DartLib('Int32x4.wwwy', 'Vv'),
    DartLib('Int32x4.wwwz', 'Vv'),
    DartLib('Int32x4.wwww', 'Vv'),
  ];
  static const doubleLibs = [
    DartLib('remainder', 'DD'),
    DartLib('abs', 'DV'),
    DartLib('roundToDouble', 'DV'),
    DartLib('floorToDouble', 'DV'),
    DartLib('ceilToDouble', 'DV'),
    DartLib('truncateToDouble', 'DV'),
    DartLib('double.tryParse', 'VS'),
    DartLib('sign', 'Dv'),
    DartLib('double.nan', 'Vv'),
    DartLib('double.infinity', 'Vv'),
    DartLib('double.negativeInfinity', 'Vv'),
    DartLib('double.minPositive', 'Vv'),
    DartLib('double.maxFinite', 'Vv'),
    DartLib('roundToDouble', 'IV'),
    DartLib('floorToDouble', 'IV'),
    DartLib('ceilToDouble', 'IV'),
    DartLib('truncateToDouble', 'IV'),
    DartLib('remainder', 'DD'),
    DartLib('abs', 'DV'),
    DartLib('roundToDouble', 'DV'),
    DartLib('floorToDouble', 'DV'),
    DartLib('ceilToDouble', 'DV'),
    DartLib('truncateToDouble', 'DV'),
    DartLib('clamp', 'DDD'),
    DartLib('toDouble', 'DV'),
    DartLib('num.tryParse', 'VS'),
    DartLib('sign', 'Dv'),
    DartLib('e', 'Vv'),
    DartLib('ln10', 'Vv'),
    DartLib('ln2', 'Vv'),
    DartLib('log2e', 'Vv'),
    DartLib('log10e', 'Vv'),
    DartLib('pi', 'Vv'),
    DartLib('sqrt1_2', 'Vv'),
    DartLib('sqrt2', 'Vv'),
    DartLib('atan2', 'VDD'),
    DartLib('pow', 'VDD'),
    DartLib('sin', 'VD'),
    DartLib('cos', 'VD'),
    DartLib('tan', 'VD'),
    DartLib('acos', 'VD'),
    DartLib('asin', 'VD'),
    DartLib('atan', 'VD'),
    DartLib('sqrt', 'VD'),
    DartLib('exp', 'VD'),
    DartLib('log', 'VD'),
  ];
  static const stringLibs = [
    DartLib('ListBase.listToString', 'VL'),
    DartLib('MapBase.mapToString', 'VM'),
    DartLib('SetBase.setToString', 'VX'),
    DartLib('base64Encode', 'VL'),
    DartLib('base64UrlEncode', 'VL'),
    DartLib('toString', 'BV'),
    DartLib('toString', 'DV'),
    DartLib('toString', 'IV'),
    DartLib('toRadixString', 'II'),
    DartLib('toStringAsFixed', 'DI'),
    DartLib('toStringAsExponential', 'DI'),
    DartLib('toStringAsPrecision', 'DI'),
    DartLib('toString', 'DV'),
    DartLib('RegExp.escape', 'VS'),
    DartLib('String.fromCharCode', 'VI'),
    DartLib('String.fromEnvironment', 'VS'),
    DartLib('substring', 'SII'),
    DartLib('trim', 'SV'),
    DartLib('trimLeft', 'SV'),
    DartLib('trimRight', 'SV'),
    DartLib('padLeft', 'Sis'),
    DartLib('padRight', 'Sis'),
    DartLib('replaceRange', 'SIIS'),
    DartLib('toLowerCase', 'SV'),
    DartLib('toUpperCase', 'SV'),
    DartLib('Uri.encodeComponent', 'VS'),
    DartLib('Uri.encodeQueryComponent', 'VS'),
    DartLib('Uri.decodeComponent', 'VS'),
    DartLib('Uri.decodeQueryComponent', 'VS'),
    DartLib('Uri.encodeFull', 'VS'),
    DartLib('Uri.decodeFull', 'VS'),
    DartLib('FileSystemEntity.parentOf', 'VS'),
  ];
  static const listLibs = [
    DartLib('List.filled', 'ViI'),
    DartLib('sublist', 'LII'),
    DartLib('codeUnits', 'Sv'),
    DartLib('Uri.parseIPv4Address', 'VS'),
    DartLib('Uri.parseIPv6Address', 'VSII'),
  ];
  static const setLibs = [
    DartLib('Set.identity', 'VV'),
    DartLib('intersection', 'XX'),
    DartLib('union', 'XX'),
    DartLib('difference', 'XX'),
    DartLib('toSet', 'XV'),
  ];
  static const mapLibs = [
    DartLib('Map.from', 'VM'),
    DartLib('Map.of', 'VM'),
    DartLib('Map.unmodifiable', 'VM'),
    DartLib('Map.identity', 'VV'),
  ];
}
