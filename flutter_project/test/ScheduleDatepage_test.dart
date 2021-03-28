import 'package:flutter/material.dart';
import 'package:flutter_project/pages/ScheduleDatepage.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget createWidgetForTesting({Widget child}){
    return MaterialApp(
      home: child,
  );}

  testWidgets('there should be exactly 4 DatePicker in this page', (WidgetTester tester) async{
    await tester.pumpWidget(createWidgetForTesting(child: new ScheduleDatepage()));
    await tester.pumpAndSettle();
    final list = find.byIcon(Icons.arrow_drop_down);
    expect(list,findsNWidgets(4));
  });

  testWidgets('there should be exactly 1 next button to be clicked', (WidgetTester tester) async{
    await tester.pumpWidget(createWidgetForTesting(child: new ScheduleDatepage()));
    await tester.pumpAndSettle();
    final list = find.text('Next');
    expect(list,findsOneWidget);
  });
}