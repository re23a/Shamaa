import 'package:flutter/material.dart';
import 'package:shamaa/screens/chat_screen.dart';
import 'package:shamaa/style/custom_colors.dart';
import 'package:shamaa/widgets/containers_sheet.dart';

class ChatGPTBottom extends StatelessWidget {
  const ChatGPTBottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ChatScreen()));
      },
      child: Row(
        children: [
          SizedBox(
            width: 11,
          ),
          Image.asset("assets/Group 632579.png"),
        ],
      ),
    );
  }
}

////===========================================================
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
            Image.asset("assets/Group 632577.png"),
            SizedBox(
              height: 5,
            ),
            Text(
              'مساعدك الشخصي ',
              style: TextStyle(
                color: black,
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
