import 'package:flutter/material.dart';
import "../pages/Start.dart";
import "../pages/Loginpage.dart";
import "../pages/Selectcategoriespage.dart";
import "../pages/Practicepage1.dart";
import "../pages/Practicepage2.dart";
import '../pages/Moodtracker.dart';
import '../pages/Item1.dart';
import '../pages/Signuppage.dart';

// All the routes
final routes = {
  '/': (context) => Moodtracker(),
  '/login': (context) => Loginpage(),
  '/start':(context)=> Start(),
  '/practice1': (context) => Practicepage1(),
  '/practice2': (context) => Practicepage2(),
  '/select': (context) => Selectcategoriespage(),
  '/session': (context) => Item1(),
  '/signup':(context) => Signuppage()
};

// This block will handle routes with or without parameter
var onGenerateRoute = (RouteSettings settings) {
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
