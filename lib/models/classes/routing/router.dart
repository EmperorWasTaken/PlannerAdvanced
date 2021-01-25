import 'package:flutter/material.dart';
import 'package:planner_advanced/UI/loginscreen.dart';
import 'package:planner_advanced/main.dart';
import 'package:planner_advanced/models/classes/routing/routing_constants.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeViewRoute:
      return MaterialPageRoute(builder: (context) => HomeScreen());
      break;
    case LoginViewRoute:
      return MaterialPageRoute(builder: (context) => LoginPage(newUser: false, login: (){print("Logged in from login");},));
      break;
    case SignupViewRoute:
      return MaterialPageRoute(builder: (context)=> LoginPage(newUser: true, login: (){print("Logged in from register");},));
      break;
    default:
      return MaterialPageRoute(builder: (context) => HomeScreen());
  }
}
