import 'package:flutter/material.dart';
import 'package:flutter_project/pages/Overpage.dart';
import 'package:flutter_project/pages/ScheduleDatepage.dart';
import 'package:flutter_project/routes/Routes.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}
void main() {  
  final mockObserver = MockNavigatorObserver();
  final routes = {
    '/over': (context) => Overpage(),
    '/date': (context) => ScheduleDatepage()
  };
  Widget createWidgetForTesting(){
    return MaterialApp(
      initialRoute: "/date",
      navigatorObservers: [mockObserver],
      routes: routes
  );}

  testWidgets('there should be exactly 4 DatePicker in this page', (WidgetTester tester) async{
    await tester.pumpWidget(createWidgetForTesting());
    await tester.pumpAndSettle();
    final list = find.byIcon(Icons.arrow_drop_down);
    expect(list,findsNWidgets(4));
  });

  testWidgets('there should be exactly 1 next button to be clicked', (WidgetTester tester) async{
    await tester.pumpWidget(createWidgetForTesting());
    await tester.pumpAndSettle();
    final list = find.text('Save');
    expect(list,findsOneWidget);
  });
  
  testWidgets('Dialog should pump out when click time field', (WidgetTester tester) async {
  await tester.pumpWidget(createWidgetForTesting());
  await tester.tap(find.byKey(Key("first")));
  await tester.pumpAndSettle();
  expect(find.byType(CalendarDatePicker), findsOneWidget); 
  });

  testWidgets('Datepicker can select a month after this month', (WidgetTester tester) async {
  await tester.pumpWidget(createWidgetForTesting());
  await tester.tap(find.byKey(Key("first")));
  await tester.pumpAndSettle();
  Finder nextMonthIcon = find.byWidgetPredicate((Widget w) => w is IconButton && (w.tooltip?.startsWith('Next month') ?? false));
  expect(nextMonthIcon, findsOneWidget);
  await tester.tap(nextMonthIcon);
  await tester.pumpAndSettle();
  Finder previousMonthIcon = find.byWidgetPredicate((Widget w) => w is IconButton && (w.tooltip?.startsWith('Previous month') ?? false));
  expect(previousMonthIcon, findsOneWidget);
  });
  testWidgets('Datepicker cannot select a month before today', (WidgetTester tester) async {
  await tester.pumpWidget(createWidgetForTesting());
  await tester.tap(find.byKey(Key("first")));
  await tester.pumpAndSettle();
  Finder previousMonthIcon = find.byWidgetPredicate((Widget w) => w is IconButton && (w.tooltip?.startsWith('Previous month') ?? false));
  expect(previousMonthIcon, findsNothing);
  });

  testWidgets('Cannot navigate to over page when breaks time order', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting());
    await tester.tap(find.byKey(Key("third")));
    await tester.pumpAndSettle();
    await tester.tap(find.text('10'));
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();
    expect(find.text('Save'), findsOneWidget);
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();
    expect(find.byType(ScheduleDatepage), findsOneWidget);
  });
}

