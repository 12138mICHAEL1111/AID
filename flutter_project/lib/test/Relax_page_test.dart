import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_project/config/Config.dart';
import 'package:flutter_project/pages/Relax.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main(){
  final dio = Dio();
  final dioAdapter = DioAdapter();
  dio.httpClientAdapter = dioAdapter;
  var path = '${Config.domain}/rest/users/login';

  Widget createWidgetForTesting({Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets('Relax page content test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: new Relax()));
    await tester.pumpAndSettle();
    final quaryFinder = find.text("How long time do you \nWant to have a relax?");
    final minsFinder = find.text("Mins");
    final startFinder = find.text("Start");
    expect(quaryFinder, findsOneWidget);
    expect(minsFinder, findsOneWidget);
    expect(startFinder, findsOneWidget);
  });
}
