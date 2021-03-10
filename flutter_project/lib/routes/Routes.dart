import 'package:flutter/material.dart';
import "../pages/Start.dart";
import "../pages/Loginpage.dart";
import "../pages/Selectcategoriespage.dart";

final routes = {
  '/': (context) => Start(),
  '/login': (context) => Loginpage(),
  '/select': (context) => Selectcategoriespage()
};

// 路由传值的固定代码
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
