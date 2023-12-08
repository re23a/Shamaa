import 'package:flutter/material.dart';
import 'package:shamaa/style/custom_colors.dart';

class BoxLesson extends StatelessWidget {
  BoxLesson({
    super.key,
    required this.color,
    required this.txt,
    required this.image,
  });
  final Color color;
  final String txt;
  final Image image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 137,
      decoration: ShapeDecoration(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(11.74),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              child: Text(
                txt,
                style: TextStyle(
                  color: black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Align(alignment: Alignment.bottomLeft, child: image),
        ],
      ),
    );
  }
}
