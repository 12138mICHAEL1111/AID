import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_project/pages/Loginpage.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  Widget createWidgetForTesting({Widget child}) {
    return MaterialApp(
      home: child,
    );
  }
  testWidgets('Login page content test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: new Loginpage()));
    await tester.pumpAndSettle();
    final accountIdFinder = find.text("Account ID");
    final passwordFinder = find.text("Password");
    expect(accountIdFinder, findsOneWidget);
    expect(passwordFinder, findsOneWidget);
  });

  testWidgets('Login button test', (WidgetTester tester) async{
    await tester.pumpWidget(createWidgetForTesting(child: new Loginpage()));
    await tester.pumpAndSettle();
    final raisedButton = find.byType(RaisedButton);
    expect(raisedButton, findsWidgets);
  });

  testWidgets('Login page click test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: new Loginpage()));
    await tester.pumpAndSettle();
    final loginButton = find.widgetWithText(RaisedButton,"Login");
    await tester.tap(loginButton);
    await tester.pump();
    final signUpButton = find.widgetWithText(RaisedButton,"Sign Up");
    await tester.tap(signUpButton);
    await tester.pump();
    final resetButton = find.widgetWithText(RaisedButton,"Reset Password");
    await tester.tap(resetButton);
    await tester.pump();
  });

  testWidgets('Login page input test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: new Loginpage()));
    await tester.pumpAndSettle();
    final inputFieldFinder = find.byType(TextField);
    expect(inputFieldFinder, findsNWidgets(2));
  });
}
