import 'package:flutter/material.dart';
import 'package:haber/constants/routes.dart';
import 'package:haber/pages/home_page.dart';
import 'package:haber/pages/landing_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        homeRoute: (context) => const HomePage(),
      },
      home: const LandingPage(),
      theme: ThemeData(
        fontFamily: "Nunito",
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
    );
  }
}
