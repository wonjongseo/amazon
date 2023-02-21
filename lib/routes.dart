import 'package:amazon/common/widget/bottom_bar.dart';
import 'package:amazon/screen/admin/add_product_screen.dart';
import 'package:amazon/screen/admin/admin_screen.dart';
import 'package:amazon/screen/aush/aush_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (context) => AuthScreen());

    case AdminScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (context) => AdminScreen());
    case BottomBar.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (context) => BottomBar());

    case AddProductScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (context) => AddProductScreen());

    default:
      return MaterialPageRoute(
          settings: routeSettings, builder: (context) => AuthScreen());
  }
}
