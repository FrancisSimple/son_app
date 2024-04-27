import 'package:emath_app/customizedTools/self_made.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

List<SubjectCard> mySubjectCards = [
    const SubjectCard(title: "Sets and Operations", imagePath: "assets/download.jpeg", footerText: "Learn about sets", isActive: true, progressPercentage: 12,),
    const SubjectCard(title: "Relations and Functions", imagePath: "assets/download.jpeg", footerText: "Functions and Operations", isActive: false,progressPercentage: 0),
    const SubjectCard(title: "Differentiation", imagePath: "assets/download.jpeg", footerText: "Enter the world of Calculus", isActive: false,progressPercentage: 0),
  ];



class SubjectsPage extends StatefulWidget {
  const SubjectsPage({super.key});

  @override
  State<SubjectsPage> createState() => _SubjectsPageState();
}

class _SubjectsPageState extends State<SubjectsPage> {
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Topics"),
          centerTitle: true,
          
          actions: [
            IconButton(onPressed: (){}, icon: const Icon(LineAwesomeIcons.user_circle),iconSize: 35,),
          ],
          bottom: const PreferredSize(preferredSize: Size.fromHeight(150),
          child: Padding(padding: EdgeInsets.all(10),
          child:  Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search,color:Colors.black),
                  hintText: "Search for a topic...",
                  hintStyle: TextStyle(color: Colors.black,),
                  contentPadding:  EdgeInsets.symmetric(vertical:16, horizontal: 10),
                  fillColor: Colors.white,
                  filled: true,
                  
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TabBar(tabs: [
                Tab(icon: Icon(LineAwesomeIcons.user_check),text:"Active"),
                Tab(icon: Icon(LineAwesomeIcons.user_clock),text:"Inactive"),
                Tab(icon: Icon(LineAwesomeIcons.list),text:"All topics"),
              ])
            ],
          ),
          ),),
        ),
        body: const TabBarView(children: [
          ActiveTopics(),
          InactiveTopics(),
          AllTopics(),
        ],)
      ),
    );
  }
}


class ActiveTopics extends StatefulWidget {
  const ActiveTopics({super.key});

  @override
  State<ActiveTopics> createState() => _ActiveTopicsState();
}

class _ActiveTopicsState extends State<ActiveTopics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          children: [
            for (var card in mySubjectCards)
              if(card.isActive)
                card
              
            
              
          ],
        )
    );
  }
}


class InactiveTopics extends StatefulWidget {
  const InactiveTopics({super.key});

  @override
  State<InactiveTopics> createState() => _InactiveTopicsState();
}

class _InactiveTopicsState extends State<InactiveTopics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          children: [
            for (var card in mySubjectCards)
              if(!card.isActive)
                card
              
            
              
          ],
        )
    );
  }
}




class AllTopics extends StatefulWidget {
  const AllTopics({super.key});

  @override
  State<AllTopics> createState() => _AllTopicsState();
}

class _AllTopicsState extends State<AllTopics> {
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: ListView(
        children: [
          for (var card in mySubjectCards)
            card,
        ],
      )
    );
  }
}



