import 'package:flutter/material.dart';
import 'package:shamaa/screens/courses/vidoe_screen.dart';
import 'package:shamaa/style/custom_colors.dart';
import 'package:shamaa/widgets/box_lesson.dart';

class LessonScreen extends StatelessWidget {
  LessonScreen({super.key});

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
        title: Text("درس عملية القسمة"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 36,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BoxLesson(
                  color: lightgreen,
                  txt: 'اختبر معرفتك',
                  image: Image.asset("assets/9548.png"),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const VideoScreen()));
                  },
                  child: BoxLesson(
                      color: blue,
                      txt: 'اكتسب المزيد من المعرفة',
                      image: Image.asset(
                          "assets/DCC2BDA3-1852-4B59-B411-6C6B07CA3C22 3.png")),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
