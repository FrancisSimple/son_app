import 'package:emath_app/pages/dashboard.dart';
// ignore_for_file: prefer_const_constructors

import 'package:emath_app/pages/homepage.dart';
import 'package:emath_app/pages/login.dart';
import 'package:emath_app/pages/signup.dart';
import 'package:emath_app/pages/subjects_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final Brightness _brightness = Brightness.light;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Elective Mathematics',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepOrange,
          brightness: _brightness,
        ),
        useMaterial3: true,
        brightness: _brightness,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.orange,
        ),
      ),
      //home: SubjectsPage(),
      routes: {
        "/": (context) => HomePage(),
        "/loginpage": (context) => LoginPage(),
        "/signuppage": (context) => SignupPage(),
        "/dashboard": (context) => DashboardProfile(),
      },
    );
  }
}
