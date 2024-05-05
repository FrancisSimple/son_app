// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

//import 'package:flutter/cupertino.dart';
// import 'package:emath_app/pages/dashboard.dart';
import 'package:emath_app/pages/dashboard.dart';
import 'package:emath_app/pages/providers.dart';
import 'package:emath_app/pages/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:flutter/widgets.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _loginKey = GlobalKey();
  final RegExp emailRegex = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    // caseSensitive: false,
  );

  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _usernameController.text.trim(),
        password: _passwordController.text.trim(),
      );
    } catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
      debugPrint("Sign In Error");
    }
    if (!context.mounted) return;
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DashboardProfile()));
    debugPrint("Sign in Successful");
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String logoLink = ref.watch(logoLinkProvider);

    return Scaffold(
      body: Center(
        //Center content
        child: Container(
          alignment: Alignment.center,
          height: 700,
          padding: EdgeInsets.symmetric(horizontal: 20),
          // color: Colors.amber,
          child: ListView(
            //Create scrollable Content
            padding: EdgeInsets.all(20),
            children: [
              Image(
                image: AssetImage(logoLink), //SON Logo
                height: 200,
              ),
              Center(
                child: Text(
                  //Login Header Text
                  "Login",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.deepOrange[900],
                  ),
                ),
              ),
              SizedBox(
                // Space between Header and Form
                height: 20,
              ),
              Form(
                // Login Form
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
                          hintText: "Your email",
                          prefixIcon: Icon(Icons.email_outlined),
                          labelText: "Email",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50)),
                          contentPadding: EdgeInsets.all(15),
                          prefixIconColor: Colors.orange[900],
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter a valid email ";
                          } else if (emailRegex
                                  .hasMatch(_usernameController.text) ==
                              false) {
                            debugPrint("Executed");
                            return "Please enter a valid email ";
                          } else {
                            return null;
                          }

                          // return null;
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
                          // debugPrint("Name: ${_usernameController.text}");
                          // debugPrint("Password: ${_passwordController.text}");
                          signIn;
                        }
                        debugPrint(
                            "Email Regex: ${emailRegex.hasMatch(_usernameController.text)}");
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
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SignupPage()));
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
