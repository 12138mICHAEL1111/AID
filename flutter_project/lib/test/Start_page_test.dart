import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_project/pages/Start.dart';
import 'package:mockito/mockito.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  final mockObserver = MockNavigatorObserver();
  Widget createWidgetForTesting() {
    return MaterialApp(
      home: Start(),
      navigatorObservers: [mockObserver],
    );
  }

  testWidgets('moodtracker page button test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting());
    await tester.pumpAndSettle();
    var image = find.byKey(Key("imageToTap"));
    expect(image, findsOneWidget);
    await tester.tap(image);
    await tester.pumpAndSettle();
    expect(image, findsNothing);
  });

}