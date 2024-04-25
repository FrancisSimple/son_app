// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

//import 'package:flutter/cupertino.dart';
import 'package:emath_app/pages/dashboard.dart';
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
      appBar: AppBar(
        title: Center(
          child: Text("Login"),
        ),
        backgroundColor: Colors.orange,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
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
                  height: 50,
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
                        }else if (value.length < 8){
                          return "Password must be at least 8 characters";
                        }
                        return null;
                      },
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_loginKey.currentState!.validate()) {
                      debugPrint("Name: ${_usernameController.text}");
                      debugPrint("Password: ${_passwordController.text}");
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>DashboardProfile()));
                    }
                  },
                  child: Text("Login"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
