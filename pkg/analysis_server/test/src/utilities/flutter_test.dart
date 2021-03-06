// Copyright (c) 2017, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:analysis_server/src/utilities/flutter.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:test/test.dart';
import 'package:test_reflective_loader/test_reflective_loader.dart';

import '../../abstract_single_unit.dart';

main() {
  defineReflectiveSuite(() {
    defineReflectiveTests(FlutterTest);
  });
}

@reflectiveTest
class FlutterTest extends AbstractSingleUnitTest {
  final flutter = Flutter.mobile;

  @override
  void setUp() {
    super.setUp();
    addFlutterPackage();
  }

  test_getWidgetPresentationText_icon() async {
    await resolveTestUnit('''
import 'package:flutter/material.dart';
var w = const Icon(Icons.book);
''');
    var w = _getTopVariableCreation('w');
    expect(flutter.getWidgetPresentationText(w), "Icon(Icons.book)");
  }

  test_getWidgetPresentationText_icon_withoutArguments() async {
    verifyNoTestUnitErrors = false;
    await resolveTestUnit('''
import 'package:flutter/material.dart';
var w = const Icon();
''');
    var w = _getTopVariableCreation('w');
    expect(flutter.getWidgetPresentationText(w), "Icon");
  }

  test_getWidgetPresentationText_notWidget() async {
    await resolveTestUnit('''
import 'package:flutter/material.dart';
var w = new Object();
''');
    var w = _getTopVariableCreation('w');
    expect(flutter.getWidgetPresentationText(w), isNull);
  }

  test_getWidgetPresentationText_text() async {
    await resolveTestUnit('''
import 'package:flutter/material.dart';
var w = const Text('foo');
''');
    var w = _getTopVariableCreation('w');
    expect(flutter.getWidgetPresentationText(w), "Text('foo')");
  }

  test_getWidgetPresentationText_text_longText() async {
    await resolveTestUnit('''
import 'package:flutter/material.dart';
var w = const Text('${'abc' * 100}');
''');
    var w = _getTopVariableCreation('w');
    expect(
      flutter.getWidgetPresentationText(w),
      "Text('abcabcabcabcab...cabcabcabcabc')",
    );
  }

  test_getWidgetPresentationText_text_withoutArguments() async {
    verifyNoTestUnitErrors = false;
    await resolveTestUnit('''
import 'package:flutter/material.dart';
var w = const Text();
''');
    var w = _getTopVariableCreation('w');
    expect(flutter.getWidgetPresentationText(w), "Text");
  }

  test_getWidgetPresentationText_unresolved() async {
    verifyNoTestUnitErrors = false;
    await resolveTestUnit('''
import 'package:flutter/material.dart';
var w = new Foo();
''');
    var w = _getTopVariableCreation('w');
    expect(flutter.getWidgetPresentationText(w), isNull);
  }

  test_identifyWidgetExpression_node_instanceCreation() async {
    await resolveTestUnit('''
import 'package:flutter/widgets.dart';

main() {
  new MyWidget(1234);
  new MyWidget.named(5678);
}

class MyWidget extends StatelessWidget {
  MyWidget(int a);
  MyWidget.named(int a);
  Widget build(BuildContext context) => null;
}
''');
    FunctionDeclaration main = testUnit.declarations[0];
    BlockFunctionBody body = main.functionExpression.body;
    List<Statement> statements = body.block.statements;

    // new MyWidget(1234);
    {
      ExpressionStatement statement = statements[0];
      InstanceCreationExpression creation = statement.expression;
      ConstructorName constructorName = creation.constructorName;
      TypeName typeName = constructorName.type;
      ArgumentList argumentList = creation.argumentList;
      expect(flutter.identifyWidgetExpression(creation), creation);
      expect(flutter.identifyWidgetExpression(constructorName), creation);
      expect(flutter.identifyWidgetExpression(typeName), creation);
      expect(flutter.identifyWidgetExpression(argumentList), isNull);
      expect(
        flutter.identifyWidgetExpression(argumentList.arguments[0]),
        isNull,
      );
    }

    // new MyWidget.named(5678);
    {
      ExpressionStatement statement = statements[1];
      InstanceCreationExpression creation = statement.expression;
      ConstructorName constructorName = creation.constructorName;
      TypeName typeName = constructorName.type;
      ArgumentList argumentList = creation.argumentList;
      expect(flutter.identifyWidgetExpression(creation), creation);
      expect(flutter.identifyWidgetExpression(constructorName), creation);
      expect(flutter.identifyWidgetExpression(typeName), creation);
      expect(flutter.identifyWidgetExpression(typeName.name), creation);
      expect(flutter.identifyWidgetExpression(constructorName.name), creation);
      expect(flutter.identifyWidgetExpression(argumentList), isNull);
      expect(
        flutter.identifyWidgetExpression(argumentList.arguments[0]),
        isNull,
      );
    }
  }

  test_identifyWidgetExpression_node_invocation() async {
    await resolveTestUnit('''
import 'package:flutter/widgets.dart';

main() {
  createEmptyText();
  createText('xyz');
}

Text createEmptyText() => new Text('');
Text createText(String txt) => new Text(txt);
''');
    {
      MethodInvocation invocation = findNodeAtString(
          "createEmptyText();", (node) => node is MethodInvocation);
      expect(flutter.identifyWidgetExpression(invocation), invocation);
      ArgumentList argumentList = invocation.argumentList;
      expect(flutter.identifyWidgetExpression(argumentList), isNull);
    }

    {
      MethodInvocation invocation = findNodeAtString(
          "createText('xyz');", (node) => node is MethodInvocation);
      expect(flutter.identifyWidgetExpression(invocation), invocation);
      ArgumentList argumentList = invocation.argumentList;
      expect(flutter.identifyWidgetExpression(argumentList), isNull);
      expect(
        flutter.identifyWidgetExpression(argumentList.arguments[0]),
        isNull,
      );
    }
  }

  test_identifyWidgetExpression_node_namedExpression() async {
    await resolveTestUnit('''
import 'package:flutter/widgets.dart';

main() {
  new Container(child: new Text(''));
}

Text createEmptyText() => new Text('');
''');
    Expression childExpression = findNodeAtString('child: ');
    expect(flutter.identifyWidgetExpression(childExpression), isNull);
  }

  test_identifyWidgetExpression_node_prefixedIdentifier_identifier() async {
    await resolveTestUnit('''
import 'package:flutter/widgets.dart';

abstract class Foo extends Widget {
  Widget bar;
}

main(Foo foo) {
  foo.bar; // ref
}
''');
    SimpleIdentifier bar = findNodeAtString('bar; // ref');
    expect(flutter.identifyWidgetExpression(bar), bar.parent);
  }

  test_identifyWidgetExpression_node_prefixedIdentifier_prefix() async {
    await resolveTestUnit('''
import 'package:flutter/widgets.dart';

abstract class Foo extends Widget {
  Widget bar;
}

main(Foo foo) {
  foo.bar; // ref
}
''');
    SimpleIdentifier foo = findNodeAtString('foo.bar');
    expect(flutter.identifyWidgetExpression(foo), foo.parent);
  }

  test_identifyWidgetExpression_node_simpleIdentifier() async {
    await resolveTestUnit('''
import 'package:flutter/widgets.dart';

main(Widget widget) {
  widget; // ref
}
''');
    Expression expression = findNodeAtString('widget; // ref');
    expect(flutter.identifyWidgetExpression(expression), expression);
  }

  test_identifyWidgetExpression_null() async {
    await resolveTestUnit('''
import 'package:flutter/widgets.dart';

main() {
  var intVariable = 42;
  intVariable;
}

Text createEmptyText() => new Text('');
''');
    expect(flutter.identifyWidgetExpression(null), isNull);
    {
      Expression expression = findNodeAtString("42;");
      expect(flutter.identifyWidgetExpression(expression), isNull);
    }

    {
      Expression expression = findNodeAtString("intVariable;");
      expect(flutter.identifyWidgetExpression(expression), isNull);
    }
  }

  test_identifyWidgetExpression_parent_argumentList() async {
    await resolveTestUnit('''
import 'package:flutter/widgets.dart';

main() {
  var text = new Text('abc');
  useWidget(text); // ref
}

void useWidget(Widget w) {}
''');
    Expression expression = findNodeAtString("text); // ref");
    expect(flutter.identifyWidgetExpression(expression), expression);
  }

  test_identifyWidgetExpression_parent_assignmentExpression() async {
    await resolveTestUnit('''
import 'package:flutter/widgets.dart';

main() {
  Widget text;
  text = Text('abc');
}

void useWidget(Widget w) {}
''');
    // Assignment itself.
    {
      var expression = findNode.simple('text =');
      expect(flutter.identifyWidgetExpression(expression), isNull);
    }

    // Left hand side.
    {
      var expression = findNode.assignment('text =');
      expect(flutter.identifyWidgetExpression(expression), isNull);
    }

    // Right hand side.
    {
      var expression = findNode.instanceCreation('Text(');
      expect(flutter.identifyWidgetExpression(expression), expression);
    }
  }

  test_identifyWidgetExpression_parent_expressionFunctionBody() async {
    await resolveTestUnit('''
import 'package:flutter/widgets.dart';

main(Widget widget) => widget; // ref
''');
    Expression expression = findNodeAtString("widget; // ref");
    expect(flutter.identifyWidgetExpression(expression), expression);
  }

  test_identifyWidgetExpression_parent_expressionStatement() async {
    await resolveTestUnit('''
import 'package:flutter/widgets.dart';

main(Widget widget) {
  widget; // ref
}
''');
    Expression expression = findNodeAtString("widget; // ref");
    expect(flutter.identifyWidgetExpression(expression), expression);
  }

  test_identifyWidgetExpression_parent_listLiteral() async {
    await resolveTestUnit('''
import 'package:flutter/widgets.dart';

main(Widget widget) {
  return [widget]; // ref
}
''');
    Expression expression = findNodeAtString("widget]; // ref");
    expect(flutter.identifyWidgetExpression(expression), expression);
  }

  test_identifyWidgetExpression_parent_namedExpression() async {
    await resolveTestUnit('''
import 'package:flutter/widgets.dart';

main() {
  var text = new Text('abc');
  useWidget(child: text); // ref
}

void useWidget({Widget child}) {}
''');
    Expression expression = findNodeAtString("text); // ref");
    expect(flutter.identifyWidgetExpression(expression), expression);
  }

  test_identifyWidgetExpression_parent_returnStatement() async {
    await resolveTestUnit('''
import 'package:flutter/widgets.dart';

main(Widget widget) {
  return widget; // ref
}
''');
    Expression expression = findNodeAtString("widget; // ref");
    expect(flutter.identifyWidgetExpression(expression), expression);
  }

  test_isWidget() async {
    await resolveTestUnit('''
import 'package:flutter/widgets.dart';

class MyStatelessWidget extends StatelessWidget {}
class MyStatefulWidget extends StatefulWidget {}
class MyContainer extends Container {}
class NotFlutter {}
class NotWidget extends State {}
''');
    var myStatelessWidget = testUnitElement.getType('MyStatelessWidget');
    expect(flutter.isWidget(myStatelessWidget), isTrue);

    var myStatefulWidget = testUnitElement.getType('MyStatefulWidget');
    expect(flutter.isWidget(myStatefulWidget), isTrue);

    var myContainer = testUnitElement.getType('MyContainer');
    expect(flutter.isWidget(myContainer), isTrue);

    var notFlutter = testUnitElement.getType('NotFlutter');
    expect(flutter.isWidget(notFlutter), isFalse);

    var notWidget = testUnitElement.getType('NotWidget');
    expect(flutter.isWidget(notWidget), isFalse);
  }

  test_isWidgetCreation() async {
    await resolveTestUnit('''
import 'package:flutter/widgets.dart';

var a = new Object();
var b = new Text('bbb');
''');
    expect(flutter.isWidgetCreation(null), isFalse);

    InstanceCreationExpression a = _getTopVariableCreation('a');
    expect(flutter.isWidgetCreation(a), isFalse);

    InstanceCreationExpression b = _getTopVariableCreation('b');
    expect(flutter.isWidgetCreation(b), isTrue);
  }

  test_isWidgetExpression() async {
    await resolveTestUnit('''
import 'package:flutter/widgets.dart';

main() {
  MyWidget.named(); // use
  var text = new Text('abc');
  text;
  createEmptyText();
  new Container(child: text);
  var intVariable = 42;
  intVariable;
}

class MyWidget extends StatelessWidget {
  MyWidget.named();
}

Text createEmptyText() => new Text('');
''');
    {
      Expression expression = findNodeAtString('named(); // use');
      expect(flutter.isWidgetExpression(expression), isFalse);
      var creation = expression.parent.parent as InstanceCreationExpression;
      expect(flutter.isWidgetExpression(creation), isTrue);
    }

    {
      Expression expression = findNodeAtString("new Text('abc')");
      expect(flutter.isWidgetExpression(expression), isTrue);
    }

    {
      Expression expression = findNodeAtString("text;");
      expect(flutter.isWidgetExpression(expression), isTrue);
    }

    {
      Expression expression = findNodeAtString(
          "createEmptyText();", (node) => node is MethodInvocation);
      expect(flutter.isWidgetExpression(expression), isTrue);
    }

    {
      SimpleIdentifier expression = findNodeAtString('Container(');
      expect(flutter.isWidgetExpression(expression), isFalse);
    }

    {
      NamedExpression expression =
          findNodeAtString('child: ', (n) => n is NamedExpression);
      expect(flutter.isWidgetExpression(expression), isFalse);
    }

    {
      Expression expression = findNodeAtString("42;");
      expect(flutter.isWidgetExpression(expression), isFalse);
    }

    {
      Expression expression = findNodeAtString("intVariable;");
      expect(flutter.isWidgetExpression(expression), isFalse);
    }
  }

  VariableDeclaration _getTopVariable(String name, [CompilationUnit unit]) {
    unit ??= testUnit;
    for (var topDeclaration in unit.declarations) {
      if (topDeclaration is TopLevelVariableDeclaration) {
        for (var variable in topDeclaration.variables.variables) {
          if (variable.name.name == name) {
            return variable;
          }
        }
      }
    }
    fail('Not found $name in $unit');
  }

  InstanceCreationExpression _getTopVariableCreation(String name,
      [CompilationUnit unit]) {
    return _getTopVariable(name, unit).initializer
        as InstanceCreationExpression;
  }
}
