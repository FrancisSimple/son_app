
import 'package:emath_app/pages/settings.dart';
import 'package:emath_app/pages/subjects_page.dart';
import 'package:emath_app/pages/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';


class DashboardProfile extends StatefulWidget {
  const DashboardProfile({super.key});

  @override
  State<DashboardProfile> createState() => _DashboardProfileState();
}

////////////DashboardProfile class: class starts
class _DashboardProfileState extends State<DashboardProfile> {

  ///////////////data field
  var isDark = false;
  var myBackgroundColor = Colors.white;
  var textColor = Colors.black;
  //////////////Constructor field: not compulsory
  
  //////////////Method field
  

  int selectIndex = 0;
  void navBottom(int index){
    setState(() {
      selectIndex = index;
    });
  }

  final List<Widget> pages =[
    const SubjectsPage(),
    const UserProfile(),
    const UserSettings(),

  ];
  //////////overriding the build method: build method starts
  @override
  Widget build(BuildContext context) {

    
    
    ////////////page scaffold starts
    return Scaffold(

      

      body: pages[selectIndex],
      /////////////////Bottom navigation bar starts
      bottomNavigationBar: GNav(
        selectedIndex: selectIndex,
        onTabChange: navBottom,
        gap: 8,
        backgroundColor: const Color.fromARGB(255, 207, 174, 124),
        tabs:  const <GButton>[
        GButton(icon: Icons.book, text:"Subject"),
        GButton(icon: Icons.person, text:"Profile"),
        GButton(icon: Icons.settings, text:"Settings"),
        ],
      ),
      /////////////////Bottom navigation bar ends
      
    );
    ////////////page scaffold ends
  }
  //////////overriding the build method: build method ends

}


    