// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:emath_app/pages/dashboard.dart';
import 'package:emath_app/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    navToLogin() {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const LoginPage()));
    }

    navToSignup() {
      Navigator.pushReplacementNamed(context, '/signuppage');
    }

    _changeMode() {
      setState(() {
        // _brightness = Brightness.dark;
      });
    }

    return Scaffold(

      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(), 
        builder: (context, snapshot){
          if(snapshot.hasData){
            return DashboardProfile();
          }
          else{
            return LoginPage();
          }
        }
        )
      // body: Container(
      //   // alignment: Alignment.center,
      //   padding: EdgeInsets.all(20),
      //   child: Column(
      //     children: [
      //       Expanded(
      //         child: ListView(
      //           shrinkWrap: true,
      //           children: [
      //             Image.asset(
      //               "assets/logo.png",
      //               height: 250,
      //             ),
      //             Center(
      //               child: Padding(
      //                 padding: const EdgeInsets.only(bottom: 50),
      //                 child: Text(
      //                   "Get Started",
      //                   style: TextStyle(
      //                     fontSize: 30,
      //                     // color: Colors.orange[900],
      //                   ),
      //                 ),
      //               ),
      //             ),
      //             Center(
      //               child: Container(
      //                 height: 200,
      //                 margin: EdgeInsets.only(bottom: 100),
      //                 // decoration: BoxDecoration(
      //                 //   color: Colors.orange[100],
      //                 // ),
      //                 child: Column(
      //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
      //                   children: [
      //                     ElevatedButton(
      //                       onPressed: navToLogin,
      //                       child: Text(
      //                         "Login",
      //                         style: TextStyle(fontSize: 20),
      //                       ),
      //                     ),
      //                     Center(
      //                       child: Text(
      //                         "Or",
      //                         style: TextStyle(fontSize: 20),
      //                       ),
      //                     ),
      //                     ElevatedButton(
      //                       onPressed: navToSignup,
      //                       child: Text(
      //                         "Sign Up",
      //                         style: TextStyle(fontSize: 20),
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //       Container(
      //         alignment: Alignment.bottomRight,
      //         child: FloatingActionButton(
      //           onPressed: _changeMode,
      //           shape: CircleBorder(),
      //           child: Icon(Icons.dark_mode_outlined),
      //         ),
      //       )
      //     ],
          
      //   ),
      // ),
    );
  }
}
