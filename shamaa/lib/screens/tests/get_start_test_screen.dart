import 'package:flutter/material.dart';
import 'package:shamaa/screens/tests/test1_screen.dart';
import 'package:shamaa/style/custom_colors.dart';
import 'package:shamaa/widgets/custom_bottoms.dart';

class GetStartTest extends StatelessWidget {
  const GetStartTest({super.key, this.index});
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
        title: Text("اختبار عملية القسمة"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * .75,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "\u2022اختبار يستهدف تقييم فهم الطلاب لعملية القسمة وقدرتهم على تطبيقها في حل المشكلات العملية",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "\u2022يتكون الاختبار من 3 أسئلة بسيطة",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "\u2022 مدة الاختبار 3 دقائق. كل سؤال يستغرق 1 دقيقة",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
          ),
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Test1Screen(
                              index: index,
                            )));
              },
              child: CustomButtomBig(text: "ابدأ الاختبار ", color: purple)),
          Spacer(),
          SizedBox(child: Image.asset('assets/Group 632713.png'))
        ],
      ),
    );
  }
}
