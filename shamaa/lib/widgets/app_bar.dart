import 'package:flutter/material.dart';

class ChatGPTBottom extends StatelessWidget {
  const ChatGPTBottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 11,
        ),
        Image.asset("assets/Group 632579.png"),
      ],
    );
  }
}

////========================================
class title extends StatelessWidget {
  const title({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("شمعة",
                style: TextStyle(
                  color: Color(0xFF3A3A3A),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                )),
            Text(
              'مساعدك الشخصي ',
              style: TextStyle(
                color: Color(0xFF3A3A3A),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
