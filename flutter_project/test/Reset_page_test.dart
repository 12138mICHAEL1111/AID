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

  test('test Dio', () async {
    dioAdapter.onPost(path).reply(200, {'message': 'success'});

    final onPostResponse = await dio.post(path);
    print(onPostResponse.data); // {message: Successfully mocked POST!}
  });
}
