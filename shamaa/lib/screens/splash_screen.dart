import 'package:flutter/material.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:shamaa/screens/ondoargind_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterSplashScreen.fadeIn(
          backgroundColor: Colors.white,
          childWidget: Padding(
            padding: const EdgeInsets.only(top: 325),
            child: Column(
              children: [
                Image.asset("assets/Logo.png"),
                Image.asset("assets/Text.png"),
              ],
            ),
          ),
          duration: const Duration(milliseconds: 3000),
          animationDuration: const Duration(milliseconds: 1000),
          onAnimationEnd: () => debugPrint("On Scale End"),
          nextScreen: const Onbaording()),
    );
  }
}
