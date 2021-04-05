import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_project/pages/Homepage.dart';
import 'package:mockito/mockito.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  final mockObserver = MockNavigatorObserver();
  Widget createWidgetForTesting({Widget child}) {
    return MaterialApp(
      home: child,
      navigatorObservers: [mockObserver],
    );
  }

  testWidgets('home page content test', (WidgetTester tester) async {
    await tester.pumpWidget(new MaterialApp(home: new Homepage()));
    expect(find.text("Welcome back！"), findsOneWidget);
    expect(
        find.text("May you be full of sunshine\n like a sun."), findsOneWidget);
  });

  testWidgets('home page button test', (WidgetTester tester) async {
    await tester.pumpWidget(new MaterialApp(home: new Homepage()));
    expect(find.byType(FlatButton), findsOneWidget);
    expect(find.byType(OutlineButton), findsWidgets);
  });

  testWidgets('home page begin button click test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: new Homepage()));
    await tester.pumpAndSettle();
    final beginBtn = find.widgetWithText(FlatButton, "Let's begin!");
    await tester.tap(beginBtn);
    await tester.pumpAndSettle();
  });
}
