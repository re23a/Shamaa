import 'package:flutter/material.dart';
import 'package:shamaa/style/custom_colors.dart';

class ChatContainer extends StatelessWidget {
  const ChatContainer({
    super.key,
    required this.isMine,
    required this.message,
  });
  final bool isMine;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMine ? Alignment.centerLeft : Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: isMine ? lightgreen : ExtraLightGrey,
                borderRadius: BorderRadius.only(
                  bottomLeft: const Radius.circular(30),
                  bottomRight: const Radius.circular(30),
                  topLeft: isMine
                      ? const Radius.circular(0)
                      : const Radius.circular(30),
                  topRight: isMine
                      ? const Radius.circular(30)
                      : const Radius.circular(0),
                )),
            child: Text(
              message,
              style: TextStyle(color: black),
            ),
          ),
        ),
      ),
    );
  }
}
