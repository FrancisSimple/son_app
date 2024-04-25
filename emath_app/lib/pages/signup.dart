// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _dobcontroller = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confpasswordController = TextEditingController();

  final GlobalKey<FormState> _signupKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,
          height: 900,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          // color: Colors.amber,
          child: ListView(
            padding: EdgeInsets.all(20),
            children: [
              Image(
                image: AssetImage("assets/logo.png"),
                height: 150,
              ),
              Center(
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.deepOrange[900],
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Form(
                key: _signupKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        // alignLabelWithHint: true,
                        // icon: Icon(Icons.person_rounded),
                        hintText: "Your email or phone",
                        prefixIcon: Icon(Icons.email_outlined),
                        labelText: "Email/Phone",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)),
                        contentPadding: EdgeInsets.all(15),
                        prefixIconColor: Colors.orange[900],
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter email or phone number";
                        }
                        return null;
                      },
                      // textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _dobcontroller,
                      keyboardType: TextInputType.datetime,
                      // obscureText: true,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.date_range_outlined),
                          hintText: "day / month / year",
                          labelText: "Date of Birth",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50)),
                          prefixIconColor: Colors.orange[900],
                          contentPadding: EdgeInsets.all(15)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your date of birth";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
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
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _confpasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.password),
                          hintText: "Confirm your Password",
                          labelText: "Confirm Password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50)),
                          prefixIconColor: Colors.orange[900],
                          contentPadding: EdgeInsets.all(15)),
                      validator: (value) {
                        if (value != _passwordController.text) {
                          return "Password mismatch";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_signupKey.currentState!.validate()) {
                          debugPrint("Name: ${_emailController.text}");
                          debugPrint("Password: ${_passwordController.text}");
                          // Navigator.pop(context);
                        }
                      },
                      child: Text("Sign Up"),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/loginpage");
                  },
                  child: Text("Have an account? Log In"))
            ],
          ),
        ),
      ),
    );
  }
}
