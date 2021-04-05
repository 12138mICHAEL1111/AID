import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_project/pages/User.dart';
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

  testWidgets('user page button test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: new User()));
    await tester.pumpAndSettle();
    final fBtn = find.byType(FlatButton);
    final oBtn = find.byType(OutlineButton);
    expect(fBtn, findsOneWidget);
    expect(oBtn, findsWidgets);
  });

  testWidgets('user page content test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: new User()));
    await tester.pumpAndSettle();
    final idFinder = find.text('Account ID');
    final emailFinder = find.text('Email');
    final psdFinder = find.text('Password');
    final profileFinder = find.text('Profile');
    final nameFinder = find.text('Real name');
    expect(idFinder, findsOneWidget);
    expect(emailFinder, findsOneWidget);
    expect(psdFinder, findsOneWidget);
    expect(profileFinder, findsOneWidget);
    expect(nameFinder, findsNothing);
  });

  testWidgets('user page reset button click test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: new User()));
    await tester.pumpAndSettle();
    final resetBtn = find.byType(FlatButton);
    await tester.tap(resetBtn);
    await tester.pumpAndSettle();
    verify(mockObserver.didPush(any, any));
  });
}
