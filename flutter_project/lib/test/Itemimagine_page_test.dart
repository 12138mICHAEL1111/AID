import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_project/config/Config.dart';
import 'package:flutter_project/pages/itemimaginepage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  final dio = Dio();
  final dioAdapter = DioAdapter();
  dio.httpClientAdapter = dioAdapter;
  var path = '${Config.domain}/rest/users/uploadprogress';

  Widget createWidgetForTesting({Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  test('test Dio', () async {
    dioAdapter.onPost(path).reply(200, {'message': 'success'});

    final onPostResponse = await dio.post(path);
    print(onPostResponse.data); // {message: Successfully mocked POST!}
  });

  testWidgets('itemImagine page content test', (WidgetTester tester) async {
    await tester
        .pumpWidget(createWidgetForTesting(child: new ItemImaginePage()));
    await tester.pumpAndSettle();
    final textfinder1 = find.text(
        "Now imagine the situation \nthat you have just read and \nwhat happened next…… for example…..");
    final textfinder2 = find.text("Next");
    expect(textfinder1, findsOneWidget);
    expect(textfinder2, findsOneWidget);
  });

  testWidgets('Next button test', (WidgetTester tester) async {
    await tester
        .pumpWidget(createWidgetForTesting(child: new ItemImaginePage()));
    await tester.pumpAndSettle();
    final flatButton = find.byType(FlatButton);
    expect(flatButton, findsOneWidget);
  });
}
