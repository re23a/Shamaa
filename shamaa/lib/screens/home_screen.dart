import 'package:flutter/material.dart';
import 'package:shamaa/screens/Courses/chapter_screen.dart';
import 'package:shamaa/screens/competition/competition_1.dart';
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
      body: Column(children: [
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
                    ExploreCourse(
                      txt: 'العلوم',
                      color: pink,
                      url: Image.asset("assets/Test tubes and flask.png"),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    ExploreCourse(
                      color: blue,
                      txt: 'اللغة العربية',
                      url: Image.asset("assets/ooooi.png"),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    ExploreCourse(
                      txt: 'الدراسات\nالاسلامية',
                      color: purple,
                      url: Image.asset("assets/ex 1.png"),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    ExploreCourse(
                        txt: 'اللغة\nالانجليزية',
                        color: lightgreen,
                        url: Image.asset("assets/18 1.png"))
                  ],
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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const Competition1();
                        }));
                      },
                      child: Competitions(
                          txt: "مسابقة المفردات \nالانجليزية",
                          url: Image.asset("assets/18 1.png")),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Competitions(
                        txt: 'مسابقة جدول\n الضرب',
                        url: Image.asset("assets/21 1.png")),
                    const SizedBox(
                      width: 12,
                    ),
                    Competitions(
                        txt: 'مسابقة الانماط',
                        url: Image.asset("assets/20 3888071.png"))
                  ],
                ),
              )
            ]))
      ]),
    );
  }
}
