import 'package:flutter/material.dart';
import 'package:shamaa/style/custom_colors.dart';

import 'package:progresso/progresso.dart';

class ChapterScreen extends StatelessWidget {
  const ChapterScreen({super.key});

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
        title: const Text("الرياضيات"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 28,
          ),
          Center(
            child: Container(
              width: 336,
              decoration: ShapeDecoration(
                color: Color(0xFFF7F7F9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: ExpansionTile(
                title: const Text(
                  'درس العمليات الحسابية',
                  style: TextStyle(
                    color: Color(0xFF3A3A3A),
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                leading: Image.asset(
                    "assets/DCC2BDA3-1852-4B59-B411-6C6B07CA3C22 1.png"),
                subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '4 فصول ',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xFF3A3A3A),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        'المدة : ساعه',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xFF3A3A3A),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Progresso(
                          progress: 0.75,
                          progressStrokeCap: StrokeCap.round,
                          backgroundStrokeCap: StrokeCap.round,
                          backgroundStrokeWidth: 10,
                          progressColor: green,
                          backgroundColor: midGrey),
                    ]),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ماذا سيتعلم الطفل بعد اجتياز هذا الدرس ؟',
                        style: TextStyle(
                          color: Color(0xFF3A3A3A),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        'عملية الجمع والطرح',
                        style: TextStyle(
                          color: Color(0xFF3A3A3A),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        'عملية الضرب والقسمه ',
                        style: TextStyle(
                          color: Color(0xFF3A3A3A),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Container(
                        width: 212,
                        height: 34,
                        padding: const EdgeInsets.all(10),
                        decoration: ShapeDecoration(
                            color: Color(0xFFE4C1F9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            )),
                        child: const Center(
                          child: Text(
                            'استئناف رحلتك ',
                            style: TextStyle(
                              color: Color(0xFF3A3A3A),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
