import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/config/Config.dart';
import 'package:flutter_project/pages/Selectcategoriespage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mockito/mockito.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  final mockObserver = MockNavigatorObserver();
  final dio = Dio();
  final dioAdapter = DioAdapter();
  dio.httpClientAdapter = dioAdapter;
  var path = '${Config.domain}/rest/users/uploadcategory';
  Widget createWidgetForTesting({Widget child}) {
    return MaterialApp(
      home: child,
      navigatorObservers: [mockObserver],
    );
  }

  testWidgets('there should be exactly 1 Social option in this page',
      (WidgetTester tester) async {
    await tester
        .pumpWidget(createWidgetForTesting(child: new Selectcategoriespage()));
    await tester.pumpAndSettle();
    final option = find.text("Social");
    expect(option, findsOneWidget);
  });

  testWidgets('there should be exactly 1 Next button in this page',
      (WidgetTester tester) async {
    await tester
        .pumpWidget(createWidgetForTesting(child: new Selectcategoriespage()));
    await tester.pumpAndSettle();
    final option = find.text("Next");
    expect(option, findsOneWidget);
  });

  testWidgets(
      'cannot navigate to next page when there is not exactly 6 options selected',
      (WidgetTester tester) async {
    await tester
        .pumpWidget(createWidgetForTesting(child: new Selectcategoriespage()));
    await tester.pumpAndSettle();
    final button = find.text("Next");
    await tester.tap(button);
    await tester.pumpAndSettle();
    expect(find.byType(Selectcategoriespage), findsOneWidget);
  });

  test('test Dio', () async {
    dioAdapter
        .onGet(path)
        .reply(200, {'message': 'success'})
        .onPost(path)
        .reply(200, {'message': 'success'});

    final onGetResponse = await dio.get(path);
    print(onGetResponse.data); // {message: Successfully mocked GET!}

    final onPostResponse = await dio.post(path);
    print(onPostResponse.data); // {message: Successfully mocked POST!}
  });
  //https://pub.dev/packages/http_mock_adapter

  testWidgets(
      'can navigate to next page when there is exactly 6 options selected',
      (WidgetTester tester) async {
    dioAdapter
        .onGet(path)
        .reply(200, {'message': 'success'})
        .onPost(path)
        .reply(200, {'message': 'success'});
    await tester
        .pumpWidget(createWidgetForTesting(child: new Selectcategoriespage()));
    await tester.pumpAndSettle();
    await tester.tap(find.text("Social"));
    await tester.pumpAndSettle();
    await tester.tap(find.text("Academic"));
    await tester.pumpAndSettle();
    await tester.tap(find.text("Hobbies"));
    await tester.pumpAndSettle();
    await tester.tap(find.text("Family"));
    await tester.pumpAndSettle();
    await tester.tap(find.text("Relationships"));
    await tester.pumpAndSettle();
    await tester.tap(find.text("Mood and Health"));
    await tester.pumpAndSettle();
    final button = find.text("Next");
    await tester.tap(button);
    await tester.pumpAndSettle(Duration(seconds: 2));
    verify(mockObserver.didPush(any, any));
  });

  testWidgets('double click an option will unselect it',
      (WidgetTester tester) async {
    dioAdapter
        .onGet(path)
        .reply(200, {'message': 'success'})
        .onPost(path)
        .reply(200, {'message': 'success'});
    await tester
        .pumpWidget(createWidgetForTesting(child: new Selectcategoriespage()));
    await tester.pumpAndSettle();
    await tester.tap(find.text("Social"));
    await tester.pumpAndSettle();
    await tester.tap(find.text("Academic"));
    await tester.pumpAndSettle();
    await tester.tap(find.text("Hobbies"));
    await tester.pumpAndSettle();
    await tester.tap(find.text("Family"));
    await tester.pumpAndSettle();
    await tester.tap(find.text("Relationships"));
    await tester.pumpAndSettle();
    await tester.tap(find.text("Mood and Health"));
    await tester.pumpAndSettle();
    await tester.tap(find.text("Family"));
    await tester.pumpAndSettle();
    final button = find.text("Next");
    await tester.tap(button);
    await tester.pumpAndSettle();
    expect(find.text("Next"), findsOneWidget);
  });
}
