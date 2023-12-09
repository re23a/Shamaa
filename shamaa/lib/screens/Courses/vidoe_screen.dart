import 'package:flutter/material.dart';
import 'package:shamaa/screens/courses/lesson%20_cmpletion.dart';
import 'package:shamaa/style/custom_colors.dart';
import 'package:shamaa/widgets/custom_bottoms.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});

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
            height: 31,
          ),
          Center(
            child: Container(
              width: 328,
              height: 250.47,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://via.placeholder.com/328x250"),
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9.94),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 72,
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
                  'القسمة هي عملية رياضية تقوم على تقسيم عدد إلى أجزاء\n متساوية.',
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
                  "رمز القسمة هو ÷",
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
                  "مثال: إذا كان لدينا 12 حلوى ونريد توزيعها بالتساوي على 3 أشخاص، يمكننا استخدام القسمة. 12 (عدد الحلوى) ÷ 3 (عدد الأشخاص) = 4 حلوى لكل شخص.",
                  style: TextStyle(
                    color: Color(0xFF3A3A3A),
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
