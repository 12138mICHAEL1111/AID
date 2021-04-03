import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/config/Config.dart';
import 'package:flutter_project/pages/Resetpasswordpage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  final dio = Dio();
  final dioAdapter = DioAdapter();
  dio.httpClientAdapter = dioAdapter;
  var path = '${Config.domain}/rest/users/resetpassword';

  // Widget createWidgetForTesting({Widget child}) {
  //   return MaterialApp(
  //     home: child,
  //
  //   );
  // }

  test('test Dio', () async{
    dioAdapter
        .onPost(path)
        .reply(200, {'message': 'success'});

    final onPostResponse = await dio.post(path);
    print(onPostResponse.data); // {message: Successfully mocked POST!}
  });

  // testWidgets('Reset page content test', (WidgetTester tester) async {
  //   await tester.pumpWidget(createWidgetForTesting(child: new Resetpasswordpage()));
  //   await tester.pumpAndSettle();
  //   final emailFinder = find.text('Email');
  //   expect(emailFinder, findsOneWidget);
  // });

}
