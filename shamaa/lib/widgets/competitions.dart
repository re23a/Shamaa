import 'package:flutter/material.dart';

class Competitions extends StatelessWidget {
  const Competitions({
    super.key,
    required this.txt,
    required this.url,
  });
  final String txt;
  final Image url;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
      height: 158,
      decoration: ShapeDecoration(
        color: Color(0xFFF7F7F9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
            ),
            child: Row(
              children: [
                Image.asset("assets/Bookmark.png"),
                SizedBox(
                  width: 12,
                ),
                Text(
                  txt,
                  style: TextStyle(
                    color: Color(0xFF3A3A3A),
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              url,
              SizedBox(
                width: 26,
              ),
              Container(
                width: 62,
                height: 60,
                decoration: ShapeDecoration(
                  color: Color(0xFFF7F7F9),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 0.50, color: Color(0xFF3A3A3A)),
                    borderRadius: BorderRadius.circular(13),
                  ),
                ),
                child: Icon(Icons.arrow_forward),
              )
            ],
          )
        ],
      ),
    );
  }
}
