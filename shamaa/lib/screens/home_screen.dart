import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progresso/progresso.dart';
import 'package:shamaa/blocs/competition_bloc/competition_bloc.dart';
import 'package:shamaa/blocs/competition_bloc/competition_state.dart';
import 'package:shamaa/screens/Courses/chapter_screen.dart';
import 'package:shamaa/screens/competition/competition_1.dart';
import 'package:shamaa/screens/competition/gamification_screen.dart';
import 'package:shamaa/screens/courses/lessons_screen.dart';
import 'package:shamaa/screens/empty_screen.dart';
import 'package:shamaa/style/custom_colors.dart';
import 'package:shamaa/widgets/app_bar.dart';
import 'package:shamaa/widgets/competitions.dart';
import 'package:shamaa/widgets/explore_course.dart';
import 'package:shamaa/widgets/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: purple,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        leading: const ChatGPTBottom(),
        title: const title(),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 12,
          ),
          const SearchBarWidget(),
          const SizedBox(
            height: 21,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'استكشف',
                  style: TextStyle(
                    color: Color(0xFF3A3A3A),
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ChapterScreen();
                          }));
                        },
                        child: ExploreCourse(
                          txt: 'الرياضيات',
                          color: yellow,
                          url: Image.asset("assets/17 1.png"),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return EmptyPage();
                          }));
                        },
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return EmptyPage();
                            }));
                          },
                          child: ExploreCourse(
                            txt: 'العلوم',
                            color: pink,
                            url: Image.asset("assets/Test tubes and flask.png"),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return EmptyPage();
                          }));
                        },
                        child: ExploreCourse(
                          color: blue,
                          txt: 'اللغة العربية',
                          url: Image.asset("assets/ooooi.png"),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return EmptyPage();
                          }));
                        },
                        child: ExploreCourse(
                          txt: 'الدراسات\nالاسلامية',
                          color: purple,
                          url: Image.asset("assets/ex 1.png"),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return EmptyPage();
                          }));
                        },
                        child: ExploreCourse(
                            txt: 'اللغة\nالانجليزية',
                            color: lightgreen,
                            url: Image.asset("assets/18 1.png")),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 21,
                ),
                const Text(
                  'إكمال المشاهدة',
                  style: TextStyle(
                    color: Color(0xFF3A3A3A),
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 10,
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
              ],
            ),
          ),
          const SizedBox(
            height: 21,
          ),
          Padding(
              padding: const EdgeInsets.only(right: 32),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'المسابقات ',
                      style: TextStyle(
                        color: Color(0xFF3A3A3A),
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          BlocBuilder<CompetitionBloc, CompetitionState>(
                            builder: (context, state) {
                              return InkWell(
                                onTap: () {
                                  state.wordIndex < 3
                                      ? Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                          return const Competition1();
                                        }))
                                      : Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                          return const GamificationScreen();
                                        }));
                                },
                                child: Competitions(
                                    txt: "مسابقة المفردات \nالانجليزية",
                                    url: Image.asset("assets/18 1.png")),
                              );
                            },
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return EmptyPage();
                              }));
                            },
                            child: Competitions(
                                txt: 'مسابقة جدول\n الضرب',
                                url: Image.asset("assets/21 1.png")),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return EmptyPage();
                              }));
                            },
                            child: Competitions(
                                txt: 'مسابقة الانماط',
                                url: Image.asset("assets/20 3888071.png")),
                          ),
                        ],
                      ),
                    )
                  ]))
        ]),
      ),
    );
  }
}
