import 'package:flutter/material.dart';
import 'package:shamaa/screens/courses/lesson%20_cmpletion.dart';
import 'package:shamaa/style/custom_colors.dart';
import 'package:shamaa/widgets/custom_bottoms.dart';
import 'package:video_player/video_player.dart';
import 'package:flick_video_player/flick_video_player.dart';

class VideoScreen extends StatefulWidget {
  VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  final FlickManager flickManager = FlickManager(
    videoPlayerController: VideoPlayerController.asset(
        'assets/تعليم عملية القسمة للأطفال بطريقة سهلة وبسيطة 2.mp4'),
  );

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
        title: Text("درس عملية القسمة"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          Center(
            child: Container(
              width: 328,
              height: 250.47,
              child: FlickVideoPlayer(flickManager: flickManager),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ملخص الدرس',
                  style: TextStyle(
                    color: black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  '\u2022القسمة هي عملية رياضية تقوم على تقسيم عدد إلى أجزاء\n متساوية.',
                  style: TextStyle(
                    color: black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "\u2022رمز القسمة هو ÷",
                  style: TextStyle(
                    color: black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "\u2022مثال: إذا كان لدينا 12 حلوى ونريد توزيعها بالتساوي على 3 أشخاص، يمكننا استخدام القسمة. 12 (عدد الحلوى) ÷ 3 (عدد الأشخاص) = 4 حلوى لكل شخص.",
                  style: TextStyle(
                    color: black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 36,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LessonCmpletionScreen()));
            },
            child: CustomButtomBig(
              color: purple,
              text: 'التالي',
            ),
          )
        ],
      ),
    );
  }
}
