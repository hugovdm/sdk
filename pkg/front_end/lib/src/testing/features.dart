// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'id_testing.dart';

/// Utility class for annotated testing representing a set of features.
class Features {
  Map<String, Object> _features = {};
  Set<String> _unsorted = new Set<String>();

  /// Mark the feature [key] as existing. If [value] is provided, the feature
  /// [key] is set to have this value.
  void add(String key, {var value: ''}) {
    _features[key] = value.toString();
  }

  /// Add [value] as an element of the list values of feature [key].
  void addElement(String key, [var value]) {
    List<String> list = _features.putIfAbsent(key, () => <String>[]);
    if (value != null) {
      list.add(value.toString());
    }
  }

  /// Marks list values of [key] as unsorted. This prevents the [getText]
  /// representation from automatically sorting the values.
  void markAsUnsorted(String key) {
    _unsorted.add(key);
  }

  /// Returns `true` if feature [key] exists.
  bool containsKey(String key) {
    return _features.containsKey(key);
  }

  /// Set the feature [key] to exist with the [value].
  void operator []=(String key, String value) {
    _features[key] = value;
  }

  /// Returns the value set for feature [key].
  Object operator [](String key) => _features[key];

  /// Removes the value set for feature [key]. Returns the existing value.
  Object remove(String key) => _features.remove(key);

  /// Returns `true` if this feature set is empty.
  bool get isEmpty => _features.isEmpty;

  /// Returns `true` if this feature set is non-empty.
  bool get isNotEmpty => _features.isNotEmpty;

  /// Call [f] for each feature in this feature set with its corresponding
  /// value.
  void forEach(void Function(String, Object) f) {
    _features.forEach(f);
  }

  /// Returns a string containing all features in a comma-separated list sorted
  /// by feature names.
  String getText() {
    StringBuffer sb = new StringBuffer();
    bool needsComma = false;
    for (String name in _features.keys.toList()..sort()) {
      dynamic value = _features[name];
      if (value != null) {
        if (needsComma) {
          sb.write(',');
        }
        sb.write(name);
        if (value is List<String>) {
          if (_unsorted.contains(name)) {
            value = '[${value.join(',')}]';
          } else {
            value = '[${(value..sort()).join(',')}]';
          }
        }
        if (value != '') {
          sb.write('=');
          sb.write(value);
        }
        needsComma = true;
      }
    }
    return sb.toString();
  }

  @override
  String toString() => 'Features(${getText()})';

  /// Creates a [Features] object by parse the [text] encoding.
  ///
  /// Single features will be parsed as strings and list features (features
  /// encoded in `[...]` will be parsed as lists of strings.
  static Features fromText(String text) {
    Features features = new Features();
    if (text == null) return features;
    int index = 0;
    while (index < text.length) {
      int eqPos = text.indexOf('=', index);
      int commaPos = text.indexOf(',', index);
      String name;
      bool hasValue = false;
      if (eqPos != -1 && commaPos != -1) {
        if (eqPos < commaPos) {
          name = text.substring(index, eqPos);
          hasValue = true;
          index = eqPos + 1;
        } else {
          name = text.substring(index, commaPos);
          index = commaPos + 1;
        }
      } else if (eqPos != -1) {
        name = text.substring(index, eqPos);
        hasValue = true;
        index = eqPos + 1;
      } else if (commaPos != -1) {
        name = text.substring(index, commaPos);
        index = commaPos + 1;
      } else {
        name = text.substring(index);
        index = text.length;
      }
      if (hasValue) {
        const Map<String, String> delimiters = const {
          '[': ']',
          '{': '}',
          '(': ')',
          '<': '>'
        };
        List<String> endDelimiters = <String>[];
        bool isList = index < text.length && text.startsWith('[', index);
        if (isList) {
          features.addElement(name);
          endDelimiters.add(']');
          index++;
        }
        int valueStart = index;
        while (index < text.length) {
          String char = text.substring(index, index + 1);
          if (endDelimiters.isNotEmpty && endDelimiters.last == char) {
            endDelimiters.removeLast();
            index++;
          } else {
            String endDelimiter = delimiters[char];
            if (endDelimiter != null) {
              endDelimiters.add(endDelimiter);
              index++;
            } else if (char == ',') {
              if (endDelimiters.isEmpty) {
                break;
              } else if (endDelimiters.length == 1 && isList) {
                String value = text.substring(valueStart, index);
                features.addElement(name, value);
                index++;
                valueStart = index;
              } else {
                index++;
              }
            } else {
              index++;
            }
          }
        }
        if (isList) {
          String value = text.substring(valueStart, index - 1);
          if (value.isNotEmpty) {
            features.addElement(name, value);
          }
        } else {
          String value = text.substring(valueStart, index);
          features.add(name, value: value);
        }
        index++;
      } else {
        features.add(name);
      }
    }
    return features;
  }
}

class FeaturesDataInterpreter implements DataInterpreter<Features> {
  const FeaturesDataInterpreter();

  @override
  String isAsExpected(Features actualFeatures, String expectedData) {
    if (expectedData == '*') {
      return null;
    } else if (expectedData == '') {
      return actualFeatures.isNotEmpty ? "Expected empty data." : null;
    } else {
      List<String> errorsFound = [];
      Features expectedFeatures = Features.fromText(expectedData);
      Set<String> validatedFeatures = new Set<String>();
      expectedFeatures.forEach((String key, Object expectedValue) {
        bool expectMatch = true;
        if (key.startsWith('!')) {
          key = key.substring(1);
          expectMatch = false;
        }
        validatedFeatures.add(key);
        Object actualValue = actualFeatures[key];
        if (!expectMatch) {
          if (actualFeatures.containsKey(key)) {
            errorsFound.add('Unexpected data found for $key=$actualValue');
          }
        } else if (!actualFeatures.containsKey(key)) {
          errorsFound.add('No data found for $key');
        } else if (expectedValue == '') {
          if (actualValue != '') {
            errorsFound.add('Non-empty data found for $key');
          }
        } else if (expectedValue == '*') {
          return;
        } else if (expectedValue is List) {
          if (actualValue is List) {
            List actualList = actualValue.toList();
            for (Object expectedObject in expectedValue) {
              String expectedText = '$expectedObject';
              bool matchFound = false;
              if (expectedText.endsWith('*')) {
                // Wildcard matcher.
                String prefix =
                    expectedText.substring(0, expectedText.indexOf('*'));
                List matches = [];
                for (Object actualObject in actualList) {
                  if ('$actualObject'.startsWith(prefix)) {
                    matches.add(actualObject);
                    matchFound = true;
                  }
                }
                for (Object match in matches) {
                  actualList.remove(match);
                }
              } else {
                for (Object actualObject in actualList) {
                  if (expectedText == '$actualObject') {
                    actualList.remove(actualObject);
                    matchFound = true;
                    break;
                  }
                }
              }
              if (!matchFound) {
                errorsFound.add("No match found for $key=[$expectedText]");
              }
            }
            if (actualList.isNotEmpty) {
              errorsFound
                  .add("Extra data found $key=[${actualList.join(',')}]");
            }
          } else {
            errorsFound.add("List data expected for $key: "
                "expected '$expectedValue', found '${actualValue}'");
          }
        } else if (expectedValue != actualValue) {
          errorsFound.add(
              "Mismatch for $key: expected '$expectedValue', found '${actualValue}'");
        }
      });
      actualFeatures.forEach((String key, Object value) {
        if (!validatedFeatures.contains(key)) {
          if (value == '') {
            errorsFound.add("Extra data found '$key'");
          } else {
            errorsFound.add("Extra data found $key=$value");
          }
        }
      });
      return errorsFound.isNotEmpty ? errorsFound.join('\n ') : null;
    }
  }

  @override
  String getText(Features actualData) {
    return actualData.getText();
  }

  @override
  bool isEmpty(Features actualData) {
    return actualData == null || actualData.isEmpty;
  }
}
