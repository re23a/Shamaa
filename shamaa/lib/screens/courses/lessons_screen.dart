import 'package:flutter/material.dart';
import 'package:shamaa/screens/courses/lesson_screen.dart';
import 'package:shamaa/style/custom_colors.dart';

class LessonsScreen extends StatelessWidget {
  const LessonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: purple,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        title: const Text("درس العمليات الحسابية"),
      ),
      body: Column(
        children: [
          InkWell(
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LessonScreen();
                }));
              },
              child: Image.asset("assets/prosess.png"))
        ],
      ),
    );
  }
}
