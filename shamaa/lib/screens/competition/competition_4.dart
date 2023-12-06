import 'package:flutter/material.dart';
import 'package:shamaa/screens/competition/gamification_screen.dart';
import 'package:shamaa/style/custom_colors.dart';
import 'package:shamaa/widgets/custom_bottoms.dart';
import 'package:shamaa/widgets/letters_container.dart';

class Competition4 extends StatelessWidget {
  const Competition4({super.key});

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
        title: Text("مسابقة المفردات الانجليزية"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                "assets/yellow star.png",
              ),
              Image.asset(
                "assets/yellow star.png",
              ),
              Image.asset(
                "assets/yellow star.png",
              ),
              Image.asset(
                "assets/yellow star.png",
              ),
            ],
          ),
          const SizedBox(
            height: 36,
          ),
          Center(
            child: Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              children: [
                Container(
                  width: 336,
                  height: 227,
                  decoration: ShapeDecoration(
                    color: blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 119,
                      ),
                      Container(
                        width: 307,
                        height: 64,
                        decoration: ShapeDecoration(
                          color: white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 200),
                  child: Container(
                    width: 160,
                    height: 160,
                    decoration: ShapeDecoration(
                      color: white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: black),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Image.asset("assets/toaster with bread.png"),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  LettersContainer(
                    color: blue,
                    text: "C",
                  ),
                  LettersContainer(
                    color: blue,
                    text: "A",
                  ),
                  LettersContainer(
                    color: blue,
                    text: "R",
                  ),
                  LettersContainer(
                    color: blue,
                    text: "H",
                  ),
                  LettersContainer(
                    color: blue,
                    text: "I",
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          InkWell(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => GamificationScreen()),
                (Route<dynamic> route) => false,
              );
            },
            child: CustomButtomBig(
              text: 'تسليم',
              color: purple,
            ),
          )
        ],
      ),
    );
  }
}
