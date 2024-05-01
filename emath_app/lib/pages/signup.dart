// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emath_app/pages/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  DateTime _dob = DateTime.now();
  var _errortextLevel, _errortextSchool;
  
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _dobcontroller = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confpasswordController = TextEditingController();

  final TextEditingController _schoolController = TextEditingController();

  final TextEditingController _levelController = TextEditingController();

  final TextEditingController _firstNameController = TextEditingController();

  final TextEditingController _surnameController = TextEditingController();

  final TextEditingController _otherNameController = TextEditingController();

  Future signUp() async {

    //creating a user
    UserCredential newUser = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _emailController.text.trim(), 
      password: _passwordController.text.trim(),
      );

    //Adding user details:
    User? thisUser = newUser.user;
    addUserDetails(thisUser!.uid,_firstNameController.text.trim(), _surnameController.text.trim(), _emailController.text.trim(), _otherNameController.text.trim(), _schoolController.text.trim(), _dobcontroller.text.trim(),_levelController.text.trim());
    
  }
  
  Future addUserDetails(String userId,String firstName,String lastName,String email,String othernames,String school,String dob,String level) async {
    await FirebaseFirestore.instance.collection("users").doc(userId).set({
      'firstName': firstName,
      'lastName': lastName,
      'otherNames': othernames,
      'email': email,
      'school': school,
      'dateOfBirth': dob,
      'year': level

    });
  }


  void _showDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ).then((value) {
      setState(() {
        _dob = value!;
        _dobcontroller.text = "${_dob.day.toString()} / ${_dob.month.toString()} / ${_dob.year.toString()}";
      });
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _firstNameController.dispose();
    _surnameController.dispose();
    _schoolController.dispose();
    _confpasswordController.dispose();
    _passwordController.dispose();
    _dobcontroller.dispose();
    _otherNameController.dispose();
    _levelController.dispose();
    super.dispose();
  }

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
                    // First Name Section
                    SizedBox(
                      width: 280,
                      child: TextFormField(
                        controller: _surnameController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          // alignLabelWithHint: true,
                          // icon: Icon(Icons.person_rounded),
                          hintText: "Your Surname name",
                          prefixIcon: Icon(Icons.person_outline),
                          labelText: "Surname",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50)),
                          contentPadding: EdgeInsets.all(15),
                          prefixIconColor: Colors.orange[900],
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your surname";
                          }
                          return null;
                        },
                        // textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // Surname Section
                    SizedBox(
                      width: 280,
                      child: TextFormField(
                        controller: _firstNameController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          // alignLabelWithHint: true,
                          // icon: Icon(Icons.person_rounded),
                          hintText: "Your first name",
                          prefixIcon: Icon(Icons.person_outline),
                          labelText: "First Name",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50)),
                          contentPadding: EdgeInsets.all(15),
                          prefixIconColor: Colors.orange[900],
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your first name";
                          }
                          return null;
                        },
                        // textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // Other name Section
                    SizedBox(
                      width: 280,
                      child: TextFormField(
                        controller: _otherNameController,
                        keyboardType: TextInputType.name,
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
                        // validator: (value) {
                        //   if (value == null || value.isEmpty) {
                        //     return "Please enter your other names";
                        //   }
                        //   return null;
                        // },
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
                    // School Selection Section
                    DropdownMenu(
                      controller: _schoolController,
                      width: 280,
                      label: Text("School"),
                      hintText: "Your school",
                      errorText: _errortextSchool,
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
                        if (value == null) {
                          setState(() {
                            _errortextSchool = "Please enter a valid school";
                          });
                        }
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
                      errorText: _errortextLevel,
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
                        if (value == null) {
                          // debugPrint(value);
                          setState(() {
                            _errortextLevel = "Please enter a valid level";
                          });
                        }
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
                        if (_errortextLevel == null) {
                          setState(() {
                            _errortextSchool = "Please enter a valid school";
                          });
                        }
                        if (_errortextLevel == null) {
                          setState(() {
                            _errortextLevel = "Please enter a valid level";
                          });
                        }
                        if (_signupKey.currentState!.validate()) {
                          debugPrint("Name: ${_emailController.text}");
                          debugPrint("Password: ${_passwordController.text}");
                          
                          signUp();
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DashboardProfile()));
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
