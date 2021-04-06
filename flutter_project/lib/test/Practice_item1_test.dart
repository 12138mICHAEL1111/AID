import 'package:flutter/material.dart';
import 'package:flutter_project/pages/Practicepage1.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';


class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  final mockObserver = MockNavigatorObserver();

  Widget createWidgetForTesting({Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets("practice item widgets test", (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: new Practicepage1()));
    await tester.pumpAndSettle();
    expect(find.text("Type in the first missing letter"), findsOneWidget);
  });

  testWidgets("practice item button test", (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: new Practicepage1()));
    await tester.pumpAndSettle();
    expect(find.byType(FlatButton), findsOneWidget);
  });

  testWidgets("practice item page click test", (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: new Practicepage1()));
    await tester.tap(find.byType(FlatButton));
    await tester.pump();
  });
}