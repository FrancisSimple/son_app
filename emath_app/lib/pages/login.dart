// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

//import 'package:flutter/cupertino.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,
          height: 600,
          padding: EdgeInsets.symmetric(horizontal: 20),
          // color: Colors.amber,
          child: ListView(
            padding: EdgeInsets.all(20),
            children: [
              Image(image: AssetImage("assets/logo.png")),
              Center(
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.deepOrange[900],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Form(
                key: _loginKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _usernameController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        // alignLabelWithHint: true,
                        // icon: Icon(Icons.person_rounded),
                        hintText: "Your Name",
                        prefixIcon: Icon(Icons.person),
                        labelText: "Username",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)),
                        contentPadding: EdgeInsets.all(15),
                        prefixIconColor: Colors.orange[900],
                      ),
                      // textAlign: TextAlign.center,
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
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_loginKey.currentState!.validate()) {
                          debugPrint("Name: ${_usernameController.text}");
                          debugPrint("Password: ${_passwordController.text}");
                          Navigator.pushNamed(context, "/dashboard");
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
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/signuppage");
                  },
                  child: Text("Don't have an account? Sign Up"))
            ],
          ),
        ),
      ),
    );
  }
}
