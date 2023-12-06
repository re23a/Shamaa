import 'package:flutter/material.dart';
import 'package:shamaa/screens/sign_up/name_signup_screen.dart';
import 'package:shamaa/style/custom_colors.dart';
import 'package:shamaa/widgets/custom_bottoms.dart';
import 'package:shamaa/widgets/progress_bar.dart';

class PasswordSingUpScreen extends StatelessWidget {
  const PasswordSingUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: const Text("تسجيل دخول "),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          ProgressBar(progress: .498),
          const SizedBox(
            height: 28,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 28),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'الرجاء إدخال كلمة المرور',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xFF3A3A3A),
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 336,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ExtraLightGrey),
                child: const TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "   ادخل كلمة المرور  ",
                      focusedBorder: InputBorder.none,
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 158, 158, 158)),
                    )),
              ),
            ],
          ),
          const SizedBox(
            height: 104,
          ),
          InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const UserNameScreen();
                }));
              },
              child: CustomButtomBig(text: 'التالي', color: purple))
        ],
      ),
    );
  }
}
