import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';
import 'package:flutter_project/config/Config.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  final mockObserver = MockNavigatorObserver();
  final dio = Dio();
  final dioAdapter = DioAdapter();
  dio.httpClientAdapter = dioAdapter;
  var pathOne = '${Config.domain}/rest/response/senddata';
  var pathTwo = '${Config.domain}/rest/users/uploadprogress';
  var pathThree = '${Config.domain}/rest/users/uploadcategory';
  Widget createWidgetForTesting({Widget child}) {
    return MaterialApp(
      home: child,
      navigatorObservers: [mockObserver],
    );
  }

  group("dio test", () {
    test('send data ', () async {
      dioAdapter
          .onGet(pathOne)
          .reply(200, {'message': 'success'})
          .onPost(pathOne)
          .reply(200, {'message': 'success'});

      final onGetResponse = await dio.get(pathOne);
      print(onGetResponse.data); // {message: Successfully mocked GET!}

      final onPostResponse = await dio.post(pathOne);
      print(onPostResponse.data); // {message: Successfully mocked POST!}
    });

    test('upload progress', () async {
      dioAdapter
          .onGet(pathTwo)
          .reply(200, {'message': 'success'})
          .onPost(pathTwo)
          .reply(200, {'message': 'success'});

      final onGetResponse = await dio.get(pathTwo);
      print(onGetResponse.data); // {message: Successfully mocked GET!}

      final onPostResponse = await dio.post(pathTwo);
      print(onPostResponse.data); // {message: Successfully mocked POST!}
    });

    test('upload category', () async {
      dioAdapter
          .onGet(pathThree)
          .reply(200, {'message': 'success'})
          .onPost(pathThree)
          .reply(200, {'message': 'success'});

      final onGetResponse = await dio.get(pathThree);
      print(onGetResponse.data); // {message: Successfully mocked GET!}

      final onPostResponse = await dio.post(pathThree);
      print(onPostResponse.data); // {message: Successfully mocked POST!}
    });
  });
}
