import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_project/pages/Moodtracker.dart';

void main() {
  Widget createWidgetForTesting({Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets('button test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: new Moodtracker()));
    await tester.pumpAndSettle();
    final fBtn = find.byType(FlatButton);
    final oBtn = find.byType(OutlineButton);
    expect(fBtn, findsNothing);
    expect(oBtn, findsOneWidget);
  });

  testWidgets('content test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: new Moodtracker()));
    await tester.pumpAndSettle();
    final anxiousFinder = find.text('Anxious');
    final happyFinder = find.text('Happy');
    final sadFinder = find.text('Sad');
    expect(anxiousFinder, findsOneWidget);
    expect(happyFinder, findsOneWidget);
    expect(sadFinder, findsOneWidget);
  });

  testWidgets('click test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: new Moodtracker()));
    await tester.pumpAndSettle();
    final oBtn = find.byType(OutlineButton);
    await tester.tap(oBtn);
    await tester.pump();
  });
}
