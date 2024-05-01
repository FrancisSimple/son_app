// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

//import 'package:flutter/cupertino.dart';
// import 'package:emath_app/pages/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _loginKey = GlobalKey();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _usernameController.text.trim(), password: _passwordController.text.trim(),
      );
  }

 @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center( //Center content
        child: Container(
          alignment: Alignment.center,
          height: 700,
          padding: EdgeInsets.symmetric(horizontal: 20),
          // color: Colors.amber,
          child: ListView( //Create scrollable Content
            padding: EdgeInsets.all(20),
            children: [
              Image(
                image: AssetImage("assets/logo.png"), //SON Logo
                height: 200,
              ),
              Center(
                child: Text( //Login Header Text
                  "Login",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.deepOrange[900],
                  ),
                ),
              ),
              SizedBox( // Space between Header and Form
                height: 20,
              ),
              Form( // Login Form
                key: _loginKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    //Username Section
                    SizedBox(
                      width: 280,
                      child: TextFormField( 
                        controller: _usernameController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          // alignLabelWithHint: true,
                          // icon: Icon(Icons.person_rounded),
                          hintText: "Your username/email/phone",
                          prefixIcon: Icon(Icons.person),
                          labelText: "Username/Email/Phone",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50)),
                          contentPadding: EdgeInsets.all(15),
                          prefixIconColor: Colors.orange[900],
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter username, email or phone number";
                          }
                          return null;
                        },
                        // textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //Password
                    SizedBox(
                      width: 280,
                      child: TextFormField( 
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.password),
                            hintText: "Your Password",
                            labelText: "Password",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50)),
                            prefixIconColor: Colors.orange[900],
                            contentPadding: EdgeInsets.all(15)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter a password";
                          } else if (value.length < 8) {
                            return "Password must be at least 8 characters";
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    //Login Button
                    ElevatedButton( 
                      onPressed: () {
                        if (_loginKey.currentState!.validate()) {
                          debugPrint("Name: ${_usernameController.text}");
                          debugPrint("Password: ${_passwordController.text}");
                          signIn();
                          // Navigator.pop(context);
                        }
                      },
                      child: Text("Login"),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),

              // sign up option
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed("/signuppage");
                },
                child: Text("Don't have an account? Sign Up"),
              )
            ],
          ),
       ),
      ),
    );
  }
}
