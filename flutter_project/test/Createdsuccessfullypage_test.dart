import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_project/pages/Createdsuccessfullypage.dart';

void main() {
  Widget createWidgetForTesting({Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets('created successfully page content test',
      (WidgetTester tester) async {
    await tester.pumpWidget(
        createWidgetForTesting(child: new Createdsuccessfullypage()));
    await tester.pumpAndSettle();
    final contentFinder = find.text(
        'You have successful \ncreated your account!\nThis is your ID:\n');
    expect(contentFinder, findsOneWidget);
  });

  testWidgets('created successfully page button test',
      (WidgetTester tester) async {
    await tester.pumpWidget(
        createWidgetForTesting(child: new Createdsuccessfullypage()));
    await tester.pumpAndSettle();
    final fBtn = find.byType(FlatButton);
    final oBtn = find.byType(OutlineButton);
    final rBtn = find.byType(RaisedButton);
    expect(fBtn, findsOneWidget);
    expect(oBtn, findsNothing);
    expect(rBtn, findsNothing);
  });

  testWidgets('created successfully page click test',
      (WidgetTester tester) async {
    await tester.pumpWidget(
        createWidgetForTesting(child: new Createdsuccessfullypage()));
    await tester.pumpAndSettle();
    final fBtn = find.byType(FlatButton);
    await tester.tap(fBtn);
    await tester.pump();
  });
}
