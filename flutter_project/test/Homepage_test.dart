// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_project/pages/Homepage.dart';

void main() {
  testWidgets('home page content test', (WidgetTester tester) async {
    await tester.pumpWidget(new MaterialApp(home: new Homepage()));
    expect(find.text("Let's begin!"), findsOneWidget);
  });

  testWidgets('home page button test', (WidgetTester tester) async {
    await tester.pumpWidget(new MaterialApp(home: new Homepage()));
    expect(find.byType(FlatButton), findsOneWidget);
  });

  testWidgets('home page click test', (WidgetTester tester) async {
    await tester.pumpWidget(new MaterialApp(home: new Homepage()));
    await tester.tap(find.byType(FlatButton));
    await tester.pump();
  });
}
