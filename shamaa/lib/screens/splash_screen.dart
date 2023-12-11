import 'package:flutter/material.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shamaa/blocs/auth_bloc/auth_bloc_bloc.dart';
import 'package:shamaa/blocs/auth_bloc/auth_bloc_state.dart';
import 'package:shamaa/screens/nav_bar.dart';
import 'package:shamaa/screens/onboarding_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthStates>(
      listener: (context, state) {
        if (state is SuccessLoginCheck) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const NavBar()),
            (route) => false,
          );
        } else if (state is ErrorLoginCheck) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const Onboarding()),
            (route) => false,
          );
        }
      },
      child: BlocBuilder<AuthBloc, AuthStates>(
        builder: (context, state) {
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
            ),
          );
        },
      ),
    );
  }
}
