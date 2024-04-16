
import 'package:amazon/Amazon_admin/admin_bar_screens/add_products.dart';
import 'package:amazon/Amazon_admin/admin_bar_screens/products_screen.dart';
import 'package:amazon/Amazon_admin/admin_screen.dart';
import 'package:amazon/Screens/authentication_pages/authentication.dart';
import 'package:amazon/Screens/authentication_pages/homeScreen/home.dart';
import 'package:amazon/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';
Route<dynamic> generateRoutes(RouteSettings routeSettings){
  switch(routeSettings.name){
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
          builder: (_)=>AuthScreen());

           case AdminScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
          builder: (_)=>AdminScreen());

           case AddProductsScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
          builder: (_)=>AddProductsScreen());

        case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
          builder: (_)=>HomeScreen());

            case BottomBar.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
          builder: (_)=>BottomBar());
    default:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_)=>Scaffold(
            body:Center(
              child: Text("Screen does not exist. 404 error"),
            )
          ));
  }
}