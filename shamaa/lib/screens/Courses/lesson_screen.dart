import 'package:flutter/material.dart';
import 'package:shamaa/screens/courses/vidoe_screen.dart';
import 'package:shamaa/screens/tests/get_start_test_screen.dart';
import 'package:shamaa/style/custom_colors.dart';
import 'package:shamaa/widgets/box_lesson.dart';

class LessonScreen extends StatelessWidget {
  LessonScreen({super.key, this.index});
  final int? index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: purple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        title: Text("درس عملية القسمة"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 36,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GetStartTest(index: index)));
                  },
                  child: BoxLesson(
                    color: lightgreen,
                    txt: 'اختبر معرفتك',
                    image: Image.asset("assets/9548.png"),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => VideoScreen()));
                  },
                  child: BoxLesson(
                      color: blue,
                      txt: 'اكتسب المزيد من المعرفة',
                      image: Image.asset(
                          "assets/DCC2BDA3-1852-4B59-B411-6C6B07CA3C22 5.png")),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
