import 'package:flutter/material.dart';

class BoxAnswer extends StatelessWidget {
  const BoxAnswer({
    super.key,
    required this.txt,
  });
  final String txt;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 50,
      decoration: ShapeDecoration(
        color: Color(0xFFEEEEEF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Center(
        child: Text(
          txt,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ),
      ),
    );
  }
}

class BoxQusetion extends StatelessWidget {
  const BoxQusetion({
    super.key,
    required this.Q,
  });
  final String Q;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 336,
      height: 75,
      decoration: ShapeDecoration(
        color: Color(0xFFEEEEEF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Text(
        Q,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xFF3A3A3A),
          fontSize: 40,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
