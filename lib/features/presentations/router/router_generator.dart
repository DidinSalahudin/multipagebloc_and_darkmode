import 'package:example_multibloc/features/presentations/screens/home/home_screen.dart';
import 'package:example_multibloc/features/presentations/screens/second/second_screen.dart';
import 'package:example_multibloc/features/presentations/screens/third/third_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  // * Routing List
  static const routeHome = "/home";
  static const routeSecond = "/second";
  static const routeThird = "/third";

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    // final arg = settings.arguments;
    print(settings.name);
    switch (settings.name) {
      case routeHome:
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
        );
        break;
      case routeSecond:
        return MaterialPageRoute(
          builder: (_) => SecondScreen(),
        );
        break;
      case routeThird:
        return MaterialPageRoute(
          builder: (_) => ThirdScreen(),
        );
        break;
      default:
    }
  }
}
