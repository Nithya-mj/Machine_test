import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:machine_test/screens/cart_screen.dart';
import 'package:machine_test/screens/catogories_screen.dart';
import 'package:machine_test/screens/homescreen.dart';
import 'package:machine_test/screens/mainscreen.dart';
import 'package:machine_test/screens/offers_screen.dart';

import '../screens/account_screen.dart';
import 'nav_const.dart';

class NavRouteGenerator {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initialRoute:
        return MaterialPageRoute(
            builder: (_) => MainScreen());
      case homeScreenRoute:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case categoryScreenRoute:
        return MaterialPageRoute(builder: (_) => CategoriesScreen());
      case offersScreenRoute:
        return MaterialPageRoute(builder: (_) => OffersScreen());
      case cartScreenRoute:
        return MaterialPageRoute(builder: (_) => CartScreen());
      case accountScreenRoute:
        return MaterialPageRoute(builder: (_)=>AccountScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                  child: Text('No route defined for ${settings.name}')),
            ));
    }
  }
}
