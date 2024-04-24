// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:emath_app/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  

  @override
  State<HomePage> createState() => _HomePageState();
  
}

class _HomePageState extends State<HomePage> {
  @override
  
  Widget build(BuildContext context) {
    navToLogin() {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginPage()));
    }

    navToSignup() {
      Navigator.pushNamed(context, '/signuppage');
    }


    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Scholar Opportunity Nexus"),
        ),
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        backgroundColor: Colors.orange,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        child: ListView(
          shrinkWrap: true,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 100),
                child: Text(
                  "Get Started",
                  style: TextStyle(
                    fontSize: 30,
                    // color: Colors.orange[900],
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                height: 200,
                margin: EdgeInsets.only(bottom: 100),
                // decoration: BoxDecoration(
                //   color: Colors.orange[100],
                // ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: navToLogin,
                      child: Text(
                        "Login",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Center(
                      child: Text(
                        "Or",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: navToSignup,
                      child: Text(
                        "Sign Up",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
