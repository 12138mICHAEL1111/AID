import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_project/pages/Moodtracker.dart';
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

  testWidgets('moodtracker page button test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: new Moodtracker()));
    await tester.pumpAndSettle();
    final fBtn = find.byType(FlatButton);
    final oBtn = find.byType(OutlineButton);
    expect(fBtn, findsNothing);
    expect(oBtn, findsOneWidget);
  });

  testWidgets('moodtracker page content test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: new Moodtracker()));
    await tester.pumpAndSettle();
    final anxiousFinder = find.text('Anxious');
    final happyFinder = find.text('Happy');
    final sadFinder = find.text('Sad');
    expect(anxiousFinder, findsOneWidget);
    expect(happyFinder, findsOneWidget);
    expect(sadFinder, findsOneWidget);
  });

  testWidgets('moodtracker page click test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: new Moodtracker()));
    await tester.pumpAndSettle();
    final nextBtn = find.widgetWithText(OutlineButton, "Next");
    await tester.tap(nextBtn);
    await tester.pumpAndSettle();
    verify(mockObserver.didPush(any, any));
  });
}
