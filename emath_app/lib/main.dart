import 'package:emath_app/pages/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SON Elective Mathematics',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DashboardProfile(),

      //////The routes section starts
      // routes:  {
      //   //First page
      //   '/':(context) => const DashboardProfile(),
      // },
      //////////The routes section ends
    );
  }
}

