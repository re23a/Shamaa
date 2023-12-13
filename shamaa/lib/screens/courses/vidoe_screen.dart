import 'package:flutter/material.dart';
import 'package:shamaa/screens/courses/lesson%20_cmpletion.dart';
import 'package:shamaa/style/custom_colors.dart';
import 'package:shamaa/widgets/custom_bottoms.dart';
import 'package:video_player/video_player.dart';
import 'package:flick_video_player/flick_video_player.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key, this.index});
  final int? index;

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  final FlickManager flickManager = FlickManager(
    videoPlayerController: VideoPlayerController.asset('assets/vid1.mp4'),
  );

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

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
        title: const Text("درس عملية القسمة"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Center(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 260,
                  decoration: ShapeDecoration(
                    color: Color(0xFFA9DEF9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: FlickVideoPlayer(flickManager: flickManager),
                  ),
                ),
                Container(
                  width: 350,
                  height: 50,
                  decoration: ShapeDecoration(
                    color: Color(0xFFFCF6BD),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Row(
                      children: [
                        Icon(Icons.watch_later_outlined),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '5 دقائق',
                          style: TextStyle(
                            color: Color(0xFF3A3A3A),
                            fontSize: 14,
                            fontFamily: '.SF Arabic Rounded',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ملخص الدرس',
                  style: TextStyle(
                    color: Color(0xFF3A3A3A),
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
                    color: Color(0xFF3A3A3A),
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
                    color: Color(0xFF3A3A3A),
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
                    color: Color(0xFF3A3A3A),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 36,
          ),
          InkWell(
            onTap: () {
              flickManager.dispose();
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
