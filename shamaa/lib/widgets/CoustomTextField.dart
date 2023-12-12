import 'package:flutter/material.dart';
import 'package:shamaa/style/custom_colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPassword;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: isPassword
          ? EdgeInsets.symmetric(horizontal: 0)
          : EdgeInsets.symmetric(horizontal: 10),
      width: 336,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: ExtraLightGrey),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            focusedBorder: InputBorder.none,
            hintStyle:
                const TextStyle(color: Color.fromARGB(255, 158, 158, 158)),
            prefixIcon: isPassword
                ? Icon(
                    Icons.lock,
                    color: Color.fromARGB(255, 158, 158, 158),
                  )
                : null),
      ),
    );
  }
}
