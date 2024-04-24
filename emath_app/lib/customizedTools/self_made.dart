

import 'package:flutter/material.dart';



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