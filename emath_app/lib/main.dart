import 'package:emath_app/pages/dashboard.dart';
// ignore_for_file: prefer_const_constructors

import 'package:emath_app/pages/homepage.dart';
import 'package:emath_app/pages/login.dart';
import 'package:emath_app/pages/providers.dart';
import 'package:emath_app/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  static Brightness _brightness = Brightness.light;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _brightness = ref.watch(ThemeProvider);
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
      darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange)),
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
