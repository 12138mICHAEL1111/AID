import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_project/pages/User.dart';

void main() {
  Widget createWidgetForTesting({Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets('user page button test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: new User()));
    await tester.pumpAndSettle();
    final fBtn = find.byType(FlatButton);
    final oBtn = find.byType(OutlineButton);
    expect(fBtn, findsOneWidget);
    expect(oBtn, findsNothing);
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

  testWidgets('user page container test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: new User()));
    await tester.pumpAndSettle();
    final imgFinder = find.byType(Container);
    expect(imgFinder, findsWidgets);
  });

  testWidgets('user page click test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: new User()));
    await tester.pumpAndSettle();
    final fBtn = find.byType(FlatButton);
    await tester.tap(fBtn);
    await tester.pump();
  });
}
