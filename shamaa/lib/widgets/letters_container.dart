import 'package:flutter/material.dart';

class LettersContainer extends StatelessWidget {
  const LettersContainer({super.key, required this.color, required this.text});
  final Color color;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 53,
      height: 53,
      decoration: ShapeDecoration(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Center(
          child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xFF3A3A3A),
          fontSize: 40,
        ),
      )),
    );
  }
}
