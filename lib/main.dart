// main.dart

import 'package:beamer/beamer.dart';
import 'package:corllel/Navigation_Screens/home_location.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: BeamerParser(),
      routerDelegate: BeamerDelegate(
        locationBuilder: (routeInformation, _) =>
            HomeLocation(routeInformation),
      ),
    );
    // return MaterialApp(
    //   home: MyApp2(),
    // );
  }
}
