import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_project/pages/Item4.dart';

void main() {
  Widget createWidgetForTesting({Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets("item4 widgets test", (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: new Item4()));
    await tester.pumpAndSettle();
    expect(find.text("Type in the first missing letter"), findsOneWidget);
  });
  testWidgets("item4 widgets test", (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: new Item4()));
    await tester.pumpAndSettle();
    expect(
        find.text(
            "   You turn the kettle on and wait\n for the water to boil.\n\nYou get a teabag out of the tin ,\nwhich you put into a mug, and \npourThe boiling water onto the\n teabag.\n\nNext, you add the …\n\n\n"),
        findsOneWidget);
  });
  testWidgets("item4 button test", (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: new Item4()));
    await tester.pumpAndSettle();
    expect(find.byType(FlatButton), findsOneWidget);
  });
  testWidgets('item4 page click test', (WidgetTester tester) async {
    await tester.pumpWidget(new MaterialApp(home: new Item4()));
    await tester.tap(find.byType(FlatButton));
    await tester.pump();
  });
}
