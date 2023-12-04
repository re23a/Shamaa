import 'package:flutter/material.dart';
import 'package:shamaa/screens/sign_in/otp_signin_screen.dart';

import 'package:shamaa/style/custom_colors.dart';
import 'package:shamaa/widgets/custom_bottoms.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: Text("تسجيل دخول "),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Stack(
            children: [
              Container(
                width: 336,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 6,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: Color(0xFFEEEEEF),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 168,
                child: Container(
                  width: 168,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 6,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Color(0xFFE4C1F9),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 28,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'الرجاء إدخال البريد الالكتروني',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xFF3A3A3A),
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'خطوات بسيطه ويكون حسابك جاهز',
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
          SizedBox(
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
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "ادخل البريد الالكتروني",
                      focusedBorder: InputBorder.none,
                      hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 158, 158, 158)),
                      prefixIcon: const Icon(
                        Icons.email,
                        color: Color.fromARGB(255, 158, 158, 158),
                      )),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 104,
          ),
          InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const OtpSingInScreen();
                }));
              },
              child: CustomButtomBig(text: 'التالي', color: purple))
        ],
      ),
    );
  }
}
