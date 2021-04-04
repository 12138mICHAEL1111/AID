import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_project/pages/Item1.dart';

void main() {
  Widget createWidgetForTesting({Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets("item1 widgets test", (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: new Item1()));
    await tester.pumpAndSettle();
    expect(find.text("Type in the first missing letter"), findsOneWidget);
  });
  testWidgets("item1 button  test", (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: new Item1()));
    await tester.pumpAndSettle();
    expect(find.byType(FlatButton), findsOneWidget);
  });
  testWidgets('item1 page click test', (WidgetTester tester) async {
    await tester.pumpWidget(new MaterialApp(home: new Item1()));
    await tester.tap(find.byType(FlatButton));
    await tester.pump();
  });
}
