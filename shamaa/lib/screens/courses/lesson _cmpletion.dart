import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

import 'package:shamaa/screens/nav_bar.dart';
import 'package:shamaa/screens/tests/get_start_test_screen.dart';
import 'package:shamaa/style/custom_colors.dart';
import 'package:shamaa/widgets/custom_bottoms.dart';

class LessonCmpletionScreen extends StatelessWidget {
  LessonCmpletionScreen({super.key});
  final assetsAudioPlayer = AssetsAudioPlayer();
  @override
  Widget build(BuildContext context) {
    assetsAudioPlayer.open(
      Audio("assets/audio.mp4"),
    );
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
        title: Text("درس عملية القسمة"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 18,
          ),
          Center(
            child: Column(
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
                  "لقد أتممت درس عملية القسمة",
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
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
                        return const GetStartTest();
                      }));
                    },
                    child:
                        CustomButtomBig(text: "انتقل للاختبار", color: blue)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
