// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:emath_app/pages/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignupPage extends ConsumerWidget {
   SignupPage({super.key});

  static DateTime _dob = DateTime.now();

  // // ignore: prefer_typing_uninitialized_variables
  // static var _errortextLevel, _errortextSchool, _errortextGender;

  // // ignore: prefer_typing_uninitialized_variables
  // var _errortextLevel, _errortextSchool, _errortextGender;

  // // ignore: prefer_typing_uninitialized_variables
  // var _errortextLevel, _errortextSchool, _errortextGender;

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _dobcontroller = TextEditingController();

  final TextEditingController _genderController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confpasswordController = TextEditingController();

  final TextEditingController _schoolController = TextEditingController();

  final TextEditingController _levelController = TextEditingController();

 

  final GlobalKey<FormState> _signupKey = GlobalKey();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String logoLink = ref.watch(logoLinkProvider);
     void _showDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ).then((value) {
      // if (value != null) {
      //   setState(() {
      //     _dob = value;
      //     _dobcontroller.text =
      //         "${_dob.day.toString()} / ${_dob.month.toString()} / ${_dob.year.toString()}";
      //   });
      // }
    });
  }
  

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
                image: AssetImage(logoLink),
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
                    // Surname Section
                    SizedBox(
                      width: 280,
                      child: TextFormField(
                        // controller: _emailController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          // alignLabelWithHint: true,
                          // icon: Icon(Icons.person_rounded),
                          hintText: "Your Surname",
                          prefixIcon: Icon(Icons.person_outline),
                          labelText: "Surname",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50)),
                          contentPadding: EdgeInsets.all(15),
                          prefixIconColor: Colors.orange[900],
                        ),
                        validator: (value) {
                          // if (value == null || value.isEmpty) {
                          //   return "Please enter surname";
                          // }
                          // return null;
                        },
                        // textAlign: TextAlign.center,
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    SizedBox(
                      width: 280,
                      child: TextFormField(
                        // controller: _emailController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          // alignLabelWithHint: true,
                          // icon: Icon(Icons.person_rounded),
                          hintText: "Your other names",
                          prefixIcon: Icon(Icons.person_outline),
                          labelText: "Other Names",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50)),
                          contentPadding: EdgeInsets.all(15),
                          prefixIconColor: Colors.orange[900],
                        ),
                        validator: (value) {
                          // if (value == null || value.isEmpty) {
                          //   return "Please enter surname";
                          // }
                          // return null;
                        },
                        // textAlign: TextAlign.center,
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    // Email
                    SizedBox(
                      width: 280,
                      child: TextFormField(
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
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    // Date of Birth Section
                    SizedBox(
                      width: 280,
                      child: TextFormField(
                        controller: _dobcontroller,
                        keyboardType: TextInputType.datetime,
                        onTap: _showDate,
                        // initialValue: _dob.toString(),
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
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    DropdownMenu(
                        controller: _genderController,
                        // controller: _schoolController,
                        width: 280,
                        label: Text("Gender"),
                        hintText: "Your gender",
                        // errorText: _errortextGender,
                        // requestFocusOnTap: true,
                        // enableFilter: true,
                        inputDecorationTheme: InputDecorationTheme(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50)),
                          prefixIconColor: Colors.orange[900],
                          contentPadding: EdgeInsets.all(15),
                        ),
                        leadingIcon: Icon(
                          Icons.person_outline_rounded,
                          // color: Colors.orange[900],
                        ),
                        dropdownMenuEntries: [
                          DropdownMenuEntry(value: "Male", label: "Male"),
                          DropdownMenuEntry(value: "Female", label: "Female"),
                        ],
                        onSelected: (value) {
                          // if (value == null) {
                          //   setState(() {
                          //     _errortextGender = "Please select your gender";
                          //   });
                          // }
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    // School Selection Section
                    DropdownMenu(
                      controller: _schoolController,
                      width: 280,
                      label: Text("School"),
                      hintText: "Your school",
                      // errorText: _errortextSchool,
                      requestFocusOnTap: true,
                      enableFilter: true,
                      inputDecorationTheme: InputDecorationTheme(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)),
                        prefixIconColor: Colors.orange[900],
                        contentPadding: EdgeInsets.all(15),
                      ),
                      leadingIcon: Icon(
                        Icons.school_outlined,
                        // color: Colors.orange[900],
                      ),
                      dropdownMenuEntries: [
                        DropdownMenuEntry(
                          value: "Ketasco",
                          label: "Keta SHS",
                        ),
                        DropdownMenuEntry(
                            value: "AcraAca", label: "Accra Academy"),
                        DropdownMenuEntry(
                            value: "Presec", label: "Presbyterian Boys SHS"),
                        DropdownMenuEntry(
                            value: "Weygeyhey", label: "Wesley Girls SHS"),
                        DropdownMenuEntry(
                            value: "Adisco", label: "Adisadel College"),
                        DropdownMenuEntry(
                            value: "Abusco", label: "Aburi Girls SHS"),
                      ],
                      onSelected: (value) {
                        // if (value == null) {
                        //   setState(() {
                        //     _errortextSchool = "Please enter a valid school";
                        //   });
                        // }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // Level Selection Section
                    DropdownMenu(
                      controller: _levelController,
                      label: Text("Level"),
                      width: 280,
                      hintText: "Your Level",
                      // errorText: _errortextLevel,
                      requestFocusOnTap: true,
                      enableFilter: true,
                      inputDecorationTheme: InputDecorationTheme(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)),
                        prefixIconColor: Colors.orange[900],
                        contentPadding: EdgeInsets.all(15),
                      ),
                      leadingIcon: Icon(
                        Icons.book_outlined,
                        // color: Colors.orange[900],
                      ),
                      dropdownMenuEntries: [
                        DropdownMenuEntry(
                            value: "None",
                            label: "SHS",
                            enabled: false,
                            style: ButtonStyle(alignment: Alignment.center)),
                        DropdownMenuEntry(value: "SHS1", label: "SHS 1"),
                        DropdownMenuEntry(value: "SHS2", label: "SHS 2"),
                        DropdownMenuEntry(value: "SHS3", label: "SHS 3"),
                      ],
                      onSelected: (value) {
                        // if (value == null) {
                        //   debugPrint(value);
                        //   setState(() {
                        //     _errortextLevel = "Please enter a valid level";
                        //   });
                        // }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // Password Section
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
                      height: 20,
                    ),
                    // Confirm Password Section
                    SizedBox(
                      width: 280,
                      child: TextFormField(
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
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // Sign Up Button
                    ElevatedButton(
                      onPressed: () {
                        // if (_errortextLevel == null ||
                        //     _errortextSchool == "Please enter a valid school") {
                        //   setState(() {
                        //     _errortextSchool = "Please enter a valid school";
                        //   });
                        // } else {
                        //   setState(() {
                        //     _errortextSchool = null;
                        //   });
                        // }
                        // if (_errortextGender == null ||
                        //     _errortextGender == "Please select your gender") {
                        //   setState(() {
                        //     _errortextGender = "Please select your gender";
                        //   });
                        // } else {
                        //   setState(() {
                        //     _errortextGender = null;
                        //   });
                        // }
                        // if (_errortextLevel == null ||
                        //     _errortextLevel == "Please enter a valid level") {
                        //   setState(() {
                        //     _errortextLevel = "Please enter a valid level";
                        //   });
                        // } else {
                        //   setState(() {
                        //     _errortextLevel = null;
                        //   });
                        // }
                        // if (_signupKey.currentState != null &&
                        //     _signupKey.currentState!.validate()) {
                        //   // debugPrint("Name: ${_emailController.text}");
                        //   // debugPrint("Password: ${_passwordController.text}");
                        //   // Navigator.pop(context);
                        // }
                        // debugPrint("Gender:$_errortextGender \nSchool:$_errortextSchool \nLevel: $_errortextLevel");
                      },
                      child: Text("Sign Up"),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),

              // Alternate Login Link
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed("/loginpage");
                  },
                  child: Text("Have an account? Log In"))
            ],
          ),
        ),
      ),
    );
  }
}
