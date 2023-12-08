import 'package:flutter/material.dart';
import 'package:shamaa/screens/tests/test_result_screen.dart';
import 'package:shamaa/style/custom_colors.dart';
import 'package:shamaa/widgets/custom_bottoms.dart';
import 'package:shamaa/widgets/tests_widgets.dart';

class Test3Screen extends StatelessWidget {
  const Test3Screen({super.key});

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
          SizedBox(
            height: 36,
          ),
          Center(
            child: Column(
              children: [
                BoxQusetion(
                  Q: '2 ÷ 12',
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
                      txt: '6',
                    ),
                    BoxAnswer(
                      txt: '3',
                    ),
                    BoxAnswer(
                      txt: '2',
                    ),
                    BoxAnswer(
                      txt: '4',
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
                              builder: (context) => TestResultScreen()));
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
