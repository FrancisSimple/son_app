import 'package:emath_app/pages/dashboard.dart';
// ignore_for_file: prefer_const_constructors

import 'package:emath_app/pages/homepage.dart';
import 'package:emath_app/pages/login.dart';
import 'package:emath_app/pages/signup.dart';
import 'package:emath_app/pages/subjects_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    await Firebase.initializeApp(options: FirebaseOptions(apiKey: "AIzaSyDeHSG-cearCEwcEeAjoAtNP9bYApD4u0o", appId: "1:880245869181:web:e94dd3438725d9a4f1ff14", messagingSenderId: "880245869181", projectId: "sonemathappdatabase",));
  }
  await Firebase.initializeApp();
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
