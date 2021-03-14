import 'package:flutter/material.dart';
import 'routes/Routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
<<<<<<< HEAD
        //initialRoute: '/', //the page this app will start at
        initialRoute: '/homepage', //the page this app will start at
        onGenerateRoute: onGenerateRoute);
=======
      debugShowCheckedModeBanner: false,
      initialRoute: '/', //the page this app will start at
      onGenerateRoute: onGenerateRoute
    );
>>>>>>> 190bd98db10153730d8eb8029f4debf533fdfe17
  }
}
