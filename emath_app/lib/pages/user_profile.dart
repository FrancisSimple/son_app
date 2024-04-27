import 'package:emath_app/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';


class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

////////////DashboardProfile class: class starts
class _UserProfileState extends State<UserProfile> {

  ///////////////data field
  var isDark = false;
  var myBackgroundColor = Colors.white;
  var textColor = Colors.black;
  //////////////Constructor field: not compulsory
  
  //////////////Method field
  

  
  //////////overriding the build method: build method starts
  @override
  Widget build(BuildContext context) {

    
    
    ////////////page scaffold starts
    return Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.orangeAccent,
        title: const Text("Profile"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){setState(() {
            isDark = !isDark;
            myBackgroundColor = (myBackgroundColor == Colors.white)? Colors.black: Colors.white;
            textColor = (textColor == Colors.black)? Colors.white: Colors.black;
          });}, icon: Icon(isDark? LineAwesomeIcons.sun: LineAwesomeIcons.moon)),
        ],

      ),

      body: SingleChildScrollView(
        child: Container(
          color: myBackgroundColor,
          padding: const EdgeInsets.all(50),
          child:   Column(children: [
            const SizedBox(
              width: 120, height: 120,
              child: CircleAvatar(radius:20,backgroundImage:  AssetImage("assets/download.jpeg")),
            ),
            const SizedBox(height: 10),
            Text("Francis Kwame Sewor", style:Theme.of(context).textTheme.headlineLarge!.copyWith(color: textColor)),
            Text("Accra-Ghana", style:Theme.of(context).textTheme.headlineSmall!.copyWith(color: textColor)),
            const SizedBox(height: 20),
            SizedBox(
              width: 200,
              child: ElevatedButton(onPressed: (){}, child: const Text("Edit Profile", style: TextStyle(color:Colors.deepOrange),),)
            ),
        
            const SizedBox(height: 30),
            const Divider(),
            const SizedBox(height: 10),
            ProfileListTile(title: "Keta Senior High School", icon: LineAwesomeIcons.school,onPress: (){},endIcon: false,textColor: textColor,),
            ProfileListTile(title: "Year Two", icon: LineAwesomeIcons.graduation_cap, onPress:(){}, endIcon: false,textColor: textColor,),
            ProfileListTile(title: "0 SON Points", icon: LineAwesomeIcons.trophy, onPress:(){}, endIcon: false,textColor: textColor,),
            ProfileListTile(title: "0 Activated Topic(s)", icon: LineAwesomeIcons.check_circle, onPress:(){}, endIcon: true,textColor: textColor,),
            ProfileListTile(title: "0 Completed quizzes", icon: LineAwesomeIcons.puzzle_piece, onPress:(){}, endIcon: true,textColor: textColor,),
            ProfileListTile(title: "0 % Performance rate", icon: LineAwesomeIcons.medal, onPress:(){}, endIcon: false,textColor: textColor,),
            ProfileListTile(title: "Logout", icon: LineAwesomeIcons.alternate_sign_out, onPress:(){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));}, endIcon: false,textColor: Colors.orange),
          ],
          ),
        ),
      ),
      /////////////////Bottom navigation bar starts
      
      /////////////////Bottom navigation bar ends
      
    );
    ////////////page scaffold ends
  }
  //////////overriding the build method: build method ends

}

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    super.key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,

  });

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {

    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    var iconColor = isDark ? Colors.orange : Colors.black;
    return ListTile(

      onTap: onPress,

      leading: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: iconColor.withOpacity(0.1),
        ),
        child: Icon(icon, color: iconColor),
      ),

      title: Text(title,style: Theme.of(context).textTheme.bodyLarge?.apply(color:textColor)),

      trailing: endIcon? Container(
        
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.orange.withOpacity(0.1),
        ),
        child: const Icon(LineAwesomeIcons.angle_right, size:18.0, color: Colors.black),
      ) : null,
      
     );
  }
}
////////////DashboardProfile class: class ends