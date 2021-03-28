import 'package:flutter/material.dart';
import 'package:flutter_project/pages/Createdsuccessfullypage.dart';
import 'package:flutter_project/pages/Overpage.dart';
import 'package:flutter_project/pages/Resetpasswordpage.dart';
import 'package:flutter_project/pages/Signuppage.dart';
import "../pages/Start.dart";
import "../pages/Loginpage.dart";
import "../pages/Selectcategoriespage.dart";
import "../pages/Practicepage1.dart";
import "../pages/Practicepage2.dart";
import '../pages/Moodtracker.dart';
import '../pages/Item1.dart';
import '../pages/IntroductionPage.dart';
import '../pages/ScheduleDatepage.dart';
import '../pages/Scheduler.dart';
import '../pages/Sessionfinishedpage.dart';
import '../pages/Item2.dart';
import '../pages/itemimaginepage.dart';
import '../pages/Overpage.dart';
import '../pages/Homepage.dart';
import '../pages/User.dart';

// All the routes
final routes = {
  '/moodtracker': (context) => Moodtracker(),
  '/practice1': (context) => Practicepage1(),
  '/practice2': (context) => Practicepage2(),
  '/select': (context) => Selectcategoriespage(),
  '/item1': (context) => Item1(itemNumber: 18, sessionNumber: 1),
  '/': (context) => Start(),
  '/login': (context) => Loginpage(),
  '/signup': (context) => Signuppage(),
  '/reset': (context,{arguments}) => Resetpasswordpage(arguments:arguments),
  '/introductionpage': (context) => IntroductionPage(),
  '/createdSuccessfully': (context) => Createdsuccessfullypage(),
  '/date': (context) => ScheduleDatepage(),
  '/ScheduleDatepage': (context) => ScheduleDatepage(),
  '/scheduler': (context) => Scheduler(),
  '/sessionfinished': (context) => Sessionfinishedpage(),
  '/imagination': (context) => itemImaginePage(),
  '/over': (context) => Overpage(),
  '/homepage': (context) => Homepage(),
  '/user': (context) => User()
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
