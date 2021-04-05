import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_project/config/Config.dart';
import 'package:flutter_project/pages/Loginpage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mockito/mockito.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  final mockObserver = MockNavigatorObserver();
  final dio = Dio();
  final dioAdapter = DioAdapter();
  dio.httpClientAdapter = dioAdapter;
  var path = '${Config.domain}/rest/users/login';

  Widget createWidgetForTesting({Widget child}) {
    return MaterialApp(
      home: child,
      navigatorObservers: [mockObserver],
    );
  }

  test('test Dio', () async {
    dioAdapter.onPost(path).reply(200, {'message': 'success'});

    final onPostResponse = await dio.post(path);
    print(onPostResponse.data); // {message: Successfully mocked POST!}
  });

  testWidgets('Login page content test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: new Loginpage()));
    await tester.pumpAndSettle();
    final accountIdFinder = find.text("Account ID");
    final passwordFinder = find.text("Password");
    expect(accountIdFinder, findsOneWidget);
    expect(passwordFinder, findsOneWidget);
  });

  testWidgets('Login button test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: new Loginpage()));
    await tester.pumpAndSettle();
    final raisedButton = find.byType(RaisedButton);
    final flatButton = find.byType(FlatButton);
    final outlineButton = find.byType(OutlineButton);
    expect(raisedButton, findsWidgets);
    expect(flatButton, findsNothing);
    expect(outlineButton, findsNothing);
  });

  testWidgets('Login page click test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: new Loginpage()));
    await tester.pumpAndSettle();
    final loginButton = find.widgetWithText(RaisedButton, "Login");
    await tester.tap(loginButton);
    await tester.pumpAndSettle();
    final signUpButton = find.widgetWithText(RaisedButton, "Sign Up");
    await tester.tap(signUpButton);
    await tester.pumpAndSettle();
    final resetButton = find.widgetWithText(RaisedButton, "Reset Password");
    await tester.tap(resetButton);
    await tester.pumpAndSettle();
    verify(mockObserver.didPush(any, any));
  });

  testWidgets('Login page input test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: new Loginpage()));
    await tester.pumpAndSettle();
    final inputFieldFinder = find.byType(TextField);
    expect(inputFieldFinder, findsNWidgets(2));
  });
}
