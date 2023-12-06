import 'package:flutter/material.dart';
import 'package:shamaa/style/custom_colors.dart';

class ContainersSheet extends StatelessWidget {
  const ContainersSheet({
    super.key,
    required this.txt,
    required this.icon,
  });
  final String txt;
  final Image icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 76,
      decoration: ShapeDecoration(
        color: Color(0xFFEEEEEF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Text(
          txt,
          textAlign: TextAlign.right,
          style: TextStyle(
            color: black,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
        Container(
          width: 66,
          height: 66,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 0.30, color: Color(0xFF3A3A3A)),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: icon,
        ),
      ]),
    );
  }
}
