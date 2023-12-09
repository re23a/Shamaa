import 'package:flutter/material.dart';

import 'package:shamaa/screens/leaderboards_screen.dart';
import 'package:shamaa/screens/nav_bar.dart';
import 'package:shamaa/style/custom_colors.dart';
import 'package:shamaa/widgets/custom_bottoms.dart';

class GamificationScreen extends StatelessWidget {
  const GamificationScreen({super.key});

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
            height: 18,
          ),
          Center(child: Image.asset("assets/Frame 632594.png")),
          Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                'براڤوووو',
                style: TextStyle(
                  color: Color(0xFF3A3A3A),
                  fontSize: 40,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Text(
                'لقد أتممت مسابقة المفردات بنجاح',
                style: TextStyle(
                  color: Color(0xFF3A3A3A),
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Image.asset("assets/gamificaton.png"),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const NavBar();
                  }));
                },
                child: CustomButtomBig(
                    text: "العودة إلى الصفحة الرئيسية", color: purple),
              ),
              const SizedBox(
                height: 12,
              ),
              InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const LeaderboardsScreen();
                    }));
                  },
                  child: CustomButtomBig(
                      text: "الذهاب الى صفحة المتصدرين", color: blue)),
            ],
          )
        ],
      ),
    );
  }
}
