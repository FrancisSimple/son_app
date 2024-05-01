import 'package:emath_app_new/firebase_options.dart';
import 'package:emath_app_new/pages/dashboard.dart';
// ignore_for_file: prefer_const_constructors

import 'package:emath_app_new/pages/homepage.dart';
import 'package:emath_app_new/pages/login.dart';
import 'package:emath_app_new/pages/signup.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  }
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
