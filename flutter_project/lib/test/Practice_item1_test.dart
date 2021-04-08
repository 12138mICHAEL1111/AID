import 'package:dio/dio.dart';
import 'package:flutter_project/config/Config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  final dio = Dio();
  final dioAdapter = DioAdapter();
  dio.httpClientAdapter = dioAdapter;
  var path = '${Config.domain}/rest/practiseitems';

  test('test Dio when upload practice items for parctice 1 page', () async {
    dioAdapter.onPost(path).reply(200, {'message': 'success'});

    final onPostResponse = await dio.post(path);
    print(onPostResponse.data); // {message: Successfully mocked POST!}
  });
}
