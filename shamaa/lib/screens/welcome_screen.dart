import 'package:flutter/material.dart';
import 'package:shamaa/screens/sign_in/email_signin_screen.dart';
import 'package:shamaa/screens/sign_up/email_signup_screen.dart';
import 'package:shamaa/style/custom_colors.dart';
import 'package:shamaa/widgets/custom_bottoms.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 203),
              child: Image.asset("assets/o.png"),
            ),
            const SizedBox(
              height: 70,
            ),
            InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const SignInScreen();
                  }));
                },
                child: CustomButtomBig(text: 'تسجيل دخول', color: purple)),
            const SizedBox(
              height: 12,
            ),
            InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const SignUpScreen();
                  }));
                },
                child: InkWell(
                    child: CustomButtomBig(
                        text: 'تسجيل ', color: ExtraLightGrey))),
          ],
        ),
      ),
    );
  }
}
