import 'package:emath_app/customizedTools/self_made.dart';
import 'package:flutter/material.dart';

class DashboardProfile extends StatefulWidget {
  const DashboardProfile({super.key});

  @override
  State<DashboardProfile> createState() => _DashboardProfileState();
}

////////////DashboardProfile class: class starts
class _DashboardProfileState extends State<DashboardProfile> {

  ///////////////data field

  //////////////Constructor field: not compulsory
  
  //////////////Method field
  


  //////////overriding the build method: build method starts
  @override
  Widget build(BuildContext context) {

    ////////////page scaffold starts
    return Scaffold(

      backgroundColor: Color.fromARGB(255, 46, 45, 43),
      ///////////Profile page: appBar starts
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("Profile"),
        centerTitle: true,

      ),
      ///////////Profile page: appBar ends
      
      /////////Profile page: body begins
      body: Container(
        
        //padding on the border of entire major container
        padding: const EdgeInsets.symmetric(horizontal: 20),

        ////////////ScrollView starts
        child: SingleChildScrollView(

          ////////////Scroll view child: container starts
          child: Column(
            //column children starts
            children: [
          
              //Column first child: expanded row starts
              Container(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                child: Row(
                  
                  
                  //First row children for avatar image and name and detail starts
                  children: [
                      //Avatar image container starts
                      Container(
                        //circle avatar for user image starts
                        //padding: const EdgeInsets.all(20),
                        child: const CircleAvatar(
                          radius: 60,
                          
                          backgroundImage: AssetImage("assets/download.jpeg"),
                        ),
                        //circle avatar for user image starts
                      ),
                      //Avatar image container ends
                
                      //user detail beside image: container starts
                      Container(
                        //padding around the text component.
                        padding: const EdgeInsets.fromLTRB(50, 20, 0, 0),
                        child: const Column(
                          
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("First Name:  Francis",
                              style: TextStyle(fontSize: 15,color: Colors.white,),
                            ),
                            Text("Surname:  Sewor",
                              style: TextStyle(fontSize: 15,color: Colors.white,),),
                            Text("Level:  SHS YEAR 2",
                              style: TextStyle(fontSize: 15,color: Colors.white,),),
                            Text("School:  Keta Senior High School",
                              style: TextStyle(fontSize: 15,color: Colors.white,),),
                            Text("SON Points:  0",
                              style: TextStyle(fontSize: 15,color: Colors.white,),),
                          ],
                        ),
                      ),
                      //user detail beside image: container ends
                    ],
                    //First row children for avatar image and name and detail ends
                  ),
              ),
              //Column first child: expanded row ends
          
              
              //second row under avatar image row begins
              const SizedBox(
                
                height: 25,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total topics activated: 0",
                      style: TextStyle(color: Colors.white,fontSize: 12),
                    ),
                    Text("Total quizzes completed: 0",
                      style: TextStyle(color: Colors.white,fontSize: 12),
                    ),
                    Text("Rate of performance: 0%",
                      style: TextStyle(color: Colors.white,fontSize: 12),
                    ),
                  ],
                )
              ),
              //second row under avatar image row ends

               
              //third row under avatar image row begins
               Container(
                padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Column(
                       
                       children: [
                         const Center(
                           child: Text("Last Visited Topic",
                             style: TextStyle(color: Colors.white,),
                           ),
                         ),
                           
                         Container(
                           height: 270,
                           width: 300,
                           
                           child: const MyCustomCard(image: "assets/download.jpeg", title: "No Topic"))
                       ],
                     ),
                   ],
                 ),
               ),
              //third row under avatar image row ends

              const Row(children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  
                  Text("Stay motivated Scholar",
                  style: TextStyle(color: Colors.white,fontSize: 30),
                  ),
                  Text("Quote intended to boost student's morale goes here."),

                ],)
              ],),
            ],
          //column children ends
          ) 
          //end of scroll view child container


        ) 
        //end of scrollview child


      ) ,
      // end of major container
 
      /////////Profile page: body ends
      
      /////////////////Bottom navigation bar starts
      bottomNavigationBar: BottomNavigationBar(items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.person), label:"Profile"),
        BottomNavigationBarItem(icon: Icon(Icons.book), label:"Subject"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label:"Settings"),
        ],
      ),
      /////////////////Bottom navigation bar ends
      
    );
    ////////////page scaffold ends
  }
  //////////overriding the build method: build method ends

}
////////////DashboardProfile class: class ends