import 'package:flutter/material.dart';
import 'package:shamaa/style/custom_colors.dart';
import 'package:shamaa/widgets/textFeild_chat.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: Text("مساعدك الشخصي"),
        backgroundColor: purple,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
      ),
      bottomSheet: ChatTextField(),
      body: ListView(
        padding: EdgeInsets.only(bottom: 100),
        children: [
          // ChatContainer(isMine: null, message: '',)
        ],
      ),
    );
  }
}
