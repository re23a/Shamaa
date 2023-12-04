import 'package:flutter/material.dart';
import 'package:shamaa/screens/sign_up/character_screen.dart';

import 'package:shamaa/style/custom_colors.dart';
import 'package:shamaa/widgets/custom_bottoms.dart';
import 'package:shamaa/widgets/progress_bar.dart';

class AgeScreen extends StatelessWidget {
  const AgeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          title: Text("إنشاء حساب"),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            ProgressBar(progress: 0.8),
            SizedBox(
              height: 28,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'الرجاء تحديد تاريخ الميلاد والصف ',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xFF3A3A3A),
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "  الصف الحالي او القادم",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xFF3A3A3A),
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 336,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ExtraLightGrey),
                  child: TextField(
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 104,
            ),
            InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const CharacterScreen();
                  }));
                },
                child: CustomButtomBig(text: 'التالي', color: purple))
          ],
        ));
  }
}
