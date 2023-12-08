import 'package:flutter/material.dart';
import 'package:shamaa/screens/tests/test3_screen.dart';
import 'package:shamaa/style/custom_colors.dart';
import 'package:shamaa/widgets/custom_bottoms.dart';
import 'package:shamaa/widgets/tests_widgets.dart';

class Test2Screen extends StatelessWidget {
  const Test2Screen({super.key});

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
        title: Text("اختبار عملية القسمة"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 101,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                "assets/stars.png",
              ),
              Image.asset(
                "assets/yellow star.png",
              ),
              Image.asset(
                "assets/yellow star.png",
              ),
            ],
          ),
          SizedBox(
            height: 36,
          ),
          Center(
            child: Column(
              children: [
                BoxQusetion(
                  Q: '5 ÷ 10',
                ),
                GridView.count(
                  mainAxisSpacing: 20,
                  childAspectRatio: 3,
                  crossAxisSpacing: 17,
                  crossAxisCount: 2,
                  padding: EdgeInsets.symmetric(horizontal: 27, vertical: 24),
                  shrinkWrap: true,
                  children: [
                    BoxAnswer(
                      txt: '1',
                    ),
                    BoxAnswer(
                      txt: '2',
                    ),
                    BoxAnswer(
                      txt: '5',
                    ),
                    BoxAnswer(
                      txt: '3',
                    ),
                  ],
                ),
                SizedBox(
                  height: 32,
                ),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Test3Screen()));
                    },
                    child:
                        CustomButtomBig(text: "السؤال التالي", color: purple))
              ],
            ),
          )
        ],
      ),
    );
  }
}
