import 'package:flutter/material.dart';

class ExploreCourse extends StatelessWidget {
  const ExploreCourse({
    super.key,
    required this.txt,
    required this.color,
    required this.url,
  });
  final String txt;
  final Color color;
  final Image url;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: ShapeDecoration(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 13),
            child: Text(
              txt,
              style: TextStyle(
                color: Color(0xFF3A3A3A),
                fontSize: 24,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 1),
            child: url,
          )
        ],
      ),
    );
  }
}
