import 'package:flutter/material.dart';
import 'package:rehberapp/screens/home/home.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomePage());
      // case secondScreenRoute:
      // return MaterialPageRoute(builder: (_) => RegisterScreen());
      //  case signInRoute:
      //    return MaterialPageRoute(
      //       builder: (_) => HomePage()); //AnimatedLoginPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Text('Ters giden birşeyler oldu'),
            ),
          ),
        );
    }
  }
}

const String homeRoute = '/';
const String secondScreenRoute = '/secondScreen';
const String signInRoute = '/signInScreen';
