import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_project/pages/Item2.dart';

void main() {
  Widget createWidgetForTesting({Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets("item2 widgets test", (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: new Item2()));
    await tester.pumpAndSettle();
    expect(find.text("Type in the first missing letter"), findsOneWidget);
  });

  testWidgets("item2 widgets test", (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: new Item2()));
    await tester.pumpAndSettle();
    expect(
        find.text(
            "The second question：\n\n\nHave you made yourself \na cup of coffee?"),
        findsOneWidget);
  });
  testWidgets("item2 button test", (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: new Item2()));
    await tester.pumpAndSettle();
    expect(find.byType(FlatButton), findsOneWidget);
  });
  testWidgets('item2 page click test', (WidgetTester tester) async {
    await tester.pumpWidget(new MaterialApp(home: new Item2()));
    await tester.tap(find.byType(FlatButton));
    await tester.pump();
  });
}
