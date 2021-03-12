import 'package:flutter/material.dart';
import 'package:flutter_project/pages/Createdsuccessfullypage.dart';
import 'package:flutter_project/pages/Resetpasswordpage.dart';
import 'package:flutter_project/pages/Signuppage.dart';
import "../pages/Start.dart";
import "../pages/Loginpage.dart";
import "../pages/Selectcategoriespage.dart";
import "../pages/Practicepage1.dart";
import "../pages/Practicepage2.dart";
import '../pages/Moodtracker.dart';
import '../pages/Item1.dart';

// All the routes
final routes = {
  '/': (context) => Moodtracker(),
  '/login': (context) => Loginpage(),
  '/practice1': (context) => Practicepage1(),
  '/practice2': (context) => Practicepage2(),
  '/select': (context) => Selectcategoriespage(),
  '/session': (context) => Item1(),
  //login,signup and reset routes
  '/': (context) => Start(),
  '/login': (context) => Loginpage(),
  '/signup':(context) => Signuppage(),
  '/reset':(context) => Resetpasswordpage(),
  '/createdSuccessfully':(context) => Createdsuccessfullypage(),
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
