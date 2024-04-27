

import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:percent_indicator/percent_indicator.dart';



class MyCustomCard extends StatelessWidget {
  final String image;
  final String title;
  final double progressValue;
  

  const MyCustomCard({
    super.key,
    required this.image,
    required this.title,
    this.progressValue = 0.1,
  });

  @override
  Widget build(BuildContext context) {
    double percentage = progressValue * 100;
    return Card(
      margin: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(),
          // Header
          Container(
            //padding: const EdgeInsets.all(16),
            color: Colors.blue,
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          // Image
          const Spacer(),
          Image.asset(
            image,
            fit: BoxFit.cover,
          ),

          const Spacer(),
          // Progress bar
          LinearProgressIndicator(
            value: progressValue,
            backgroundColor: Colors.grey[300],
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
          ),
          Center(child: Text("$percentage %")),
        ],
      ),
    );
  }
}


class SubjectCard extends StatefulWidget {

  final String title;
  final String imagePath;
  final String footerText;
  final bool isActive;
  final double progressPercentage;

  const SubjectCard({super.key,
    required this.title,
    required this.imagePath,
    required this.footerText,
    required this.isActive,
    required this.progressPercentage,
  });
  
  @override
  State<SubjectCard> createState() => _SubjectCardState();
}

class _SubjectCardState extends State<SubjectCard> {
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 15,
        color: Colors.orangeAccent,
        margin: const EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title:Padding(
                padding: const EdgeInsets.only(right:8.0),
                child: Text(widget.title, textAlign: TextAlign.center,style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
              ),
              trailing: widget.isActive ? const Padding(
                padding: EdgeInsets.only(left:4.0),
                child: Icon(LineAwesomeIcons.user_check,color:Colors.green),
              ) : const Padding(
                padding: EdgeInsets.only(left:4.0),
                child: Icon(LineAwesomeIcons.user_clock, color:Colors.red),
              ),
              onTap: (){},
            ),
            Image.asset(widget.imagePath, fit:BoxFit.cover,),
            Container(
              padding: const EdgeInsets.all(15),
              child: Text(widget.footerText,textAlign: TextAlign.center,style:const TextStyle(fontWeight: FontWeight.bold)),
            ),
            
            if(widget.isActive)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: LinearPercentIndicator(
                  animation: true,
                  animationDuration: 1000,
                  lineHeight: 20,
                  percent: widget.progressPercentage/100,
                  progressColor: Colors.yellow,
                  backgroundColor: Colors.white,
                  
                ),
              ),
            const SizedBox(height:10,),
            Text("Progess made: ${widget.progressPercentage} %"),
            const SizedBox(height:10,),
              
            
          ],
        )

      ),
    );
  }
}
