import 'package:flutter/material.dart';
import 'package:progresso/progresso.dart';
import 'package:shamaa/screens/courses/lessons_screen.dart';

import 'package:shamaa/style/custom_colors.dart';

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
          Column(
            children: [
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
                          const Text(
                            '4 فصول ',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Color(0xFF3A3A3A),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const Text(
                            'المدة : ساعه',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Color(0xFF3A3A3A),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(
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
                          const Text(
                            'ماذا سيتعلم الطفل بعد اجتياز هذا الدرس ؟',
                            style: TextStyle(
                              color: Color(0xFF3A3A3A),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const Text(
                            '-عملية الجمع والطرح',
                            style: TextStyle(
                              color: Color(0xFF3A3A3A),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const Text(
                            '-عملية الضرب والقسمه ',
                            style: TextStyle(
                              color: Color(0xFF3A3A3A),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(
                            height: 22,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return LessonsScreen();
                              }));
                            },
                            child: Container(
                              width: 212,
                              height: 34,
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
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                width: 336,
                decoration: ShapeDecoration(
                  color: Color(0xFFF7F7F9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: ExpansionTile(
                  title: const Text(
                    'المقارنة والتصنيف',
                    style: TextStyle(
                      color: Color(0xFF3A3A3A),
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  leading: Image.asset("assets/9550.png"),
                  subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '3 فصول ',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Color(0xFF3A3A3A),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const Text(
                          'المدة : ساعه',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Color(0xFF3A3A3A),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Progresso(
                            progress: 0,
                            progressStrokeCap: StrokeCap.round,
                            backgroundStrokeCap: StrokeCap.round,
                            backgroundStrokeWidth: 10,
                            progressColor: midGrey,
                            backgroundColor: midGrey),
                      ]),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'ماذا سيتعلم الطفل بعد اجتياز هذا الدرس ؟',
                          style: TextStyle(
                            color: Color(0xFF3A3A3A),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const Text(
                          '-التصنيف وفق خاصية واحدة',
                          style: TextStyle(
                            color: Color(0xFF3A3A3A),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const Text(
                          '-اكثر من ، اقل من',
                          style: TextStyle(
                            color: Color(0xFF3A3A3A),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          height: 22,
                        ),
                        Container(
                          width: 212,
                          height: 34,
                          decoration: ShapeDecoration(
                              color: Color(0xFFE4C1F9),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              )),
                          child: const Center(
                            child: Text(
                              'ابدأ رحلتك',
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
              const SizedBox(
                height: 24,
              ),
              Container(
                width: 336,
                decoration: ShapeDecoration(
                  color: Color(0xFFF7F7F9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: ExpansionTile(
                  title: const Text(
                    'الموقع والنمط',
                    style: TextStyle(
                      color: Color(0xFF3A3A3A),
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  leading: Image.asset("assets/9549.png"),
                  subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '3 فصول ',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Color(0xFF3A3A3A),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const Text(
                          'المدة : ساعه',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Color(0xFF3A3A3A),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Progresso(
                            progress: 0,
                            progressStrokeCap: StrokeCap.round,
                            backgroundStrokeCap: StrokeCap.round,
                            backgroundStrokeWidth: 10,
                            progressColor: midGrey,
                            backgroundColor: midGrey),
                      ]),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'ماذا سيتعلم الطفل بعد اجتياز هذا الدرس ؟',
                          style: TextStyle(
                            color: Color(0xFF3A3A3A),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const Text(
                          '-فوق،تحت',
                          style: TextStyle(
                            color: Color(0xFF3A3A3A),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const Text(
                          "-اسفل ، اعلى",
                          style: TextStyle(
                            color: Color(0xFF3A3A3A),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          height: 22,
                        ),
                        Container(
                          width: 212,
                          height: 34,
                          decoration: ShapeDecoration(
                              color: Color(0xFFE4C1F9),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              )),
                          child: const Center(
                            child: Text(
                              'ابدأ رحلتك',
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
              )
            ],
          ),
        ],
      ),
    );
  }
}
