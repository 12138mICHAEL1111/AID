import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/config/Config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_project/pages/Signuppage.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mockito/mockito.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  final mockObserver = MockNavigatorObserver();
  final dio = Dio();
  final dioAdapter = DioAdapter();
  dio.httpClientAdapter = dioAdapter;
  var path = '${Config.domain}/rest/users/signup';

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

  testWidgets('Sign up page input test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: new Signuppage()));
    await tester.pumpAndSettle();
    final inputFieldFinder = find.byType(TextField);
    expect(inputFieldFinder, findsNWidgets(2));
  });
}
