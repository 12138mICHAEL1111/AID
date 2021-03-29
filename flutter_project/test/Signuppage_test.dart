import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_project/pages/Signuppage.dart';

void main() {
  Widget createWidgetForTesting({Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets('Sign up page content test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: new Signuppage()));
    await tester.pumpAndSettle();
    final emailFinder = find.text('Email');
    final psdFinder = find.text('Password');
    final signupFinder = find.text('Sign Up');
    final createFinder = find.text('Create your account');
    final resetFinder = find.text('Reset your account');
    expect(emailFinder, findsOneWidget);
    expect(psdFinder, findsOneWidget);
    expect(signupFinder, findsOneWidget);
    expect(createFinder, findsOneWidget);
    expect(resetFinder, findsNothing);
  });

  testWidgets('Sign up page button test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: new Signuppage()));
    await tester.pumpAndSettle();
    final fBtn = find.byType(FlatButton);
    final oBtn = find.byType(OutlineButton);
    final rBtn = find.byType(RaisedButton);
    expect(fBtn, findsOneWidget);
    expect(oBtn, findsNothing);
    expect(rBtn, findsNothing);
  });

  testWidgets('Sign up page click test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: new Signuppage()));
    await tester.pumpAndSettle();
    final fBtn = find.byType(FlatButton);
    await tester.tap(fBtn);
    await tester.pump();
  });
}
