import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rehberapp/screens/locations/locations.dart';
import 'package:rehberapp/screens/onboarding/onboarding_page.dart';
import 'package:rehberapp/utils/constant.dart';
import 'utils/router.dart' as router;

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var border = InputBorder.none;
    return MaterialApp(
      title: 'Rehber App',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.Router.generateRoute,
      initialRoute: router.homeRoute,
      theme: ThemeData(
          scaffoldBackgroundColor: kWhiteColor,
          primaryColor: kPrimaryColor,
          textTheme:
              Theme.of(context).textTheme.apply(bodyColor: kDarkBlackColor),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: kFontFamilyRaleway,
          inputDecorationTheme: InputDecorationTheme(
            border: border,
            focusedBorder: border,
            focusedErrorBorder: border,
          )),
      home:
          OnboardingPage(), // LocationsPage() //OnboardingPage(), //SplashScreen(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
