import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_project/pages/Sessionfinishedpage.dart';
import 'package:flutter_test/flutter_test.dart';
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

  testWidgets('sessionFinished page content test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: new Sessionfinishedpage(itemNumber: 10, sessionNumber: 10)));
    await tester.pumpAndSettle();
    final textfinder1 = find.text("Congratulations!");
    final textfinder2 = find.text("Home Page");
    expect(textfinder1, findsOneWidget);
    expect(textfinder2, findsOneWidget);
  });

}
