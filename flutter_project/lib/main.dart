import 'package:flutter/material.dart';
import 'routes/Routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        //initialRoute: '/login', //the page this app will start at
        initialRoute: '/item1',
        onGenerateRoute: onGenerateRoute);
  }
}
