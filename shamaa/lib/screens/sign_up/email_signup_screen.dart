import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shamaa/blocs/auth_bloc/auth_bloc_bloc.dart';
import 'package:shamaa/blocs/auth_bloc/auth_bloc_event.dart';
import 'package:shamaa/blocs/auth_bloc/auth_bloc_state.dart';

import 'package:shamaa/screens/sign_up/otp_screen.dart';
import 'package:shamaa/style/custom_colors.dart';
import 'package:shamaa/widgets/CoustomTextField.dart';
import 'package:shamaa/widgets/custom_bottoms.dart';
import 'package:shamaa/widgets/progress_bar.dart';

class SignUpScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("إنشاء حساب"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const ProgressBar(
                progress: 0.166), // Make sure this widget is defined
            const SizedBox(height: 28),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 28),
              child: Text(
                'خطوات بسيطه ويكون حسابك جاهز',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xFF3A3A3A),
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: 30),
            CustomTextField(
              controller: emailController,
              hintText: "ادخل البريد الالكتروني",
              isPassword: false,
            ),
            SizedBox(height: 20),
            CustomTextField(
              controller: passwordController,
              hintText: "ادخل الرقم السري",
              isPassword: true,
            ),
            const SizedBox(height: 104),
            _buildSignUpButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSignUpButton(BuildContext context) {
    return BlocListener<AuthBloc, AuthStates>(
      listener: (context, state) {
        if (state is LoadingSignUpState) {
          print("sign up");
          showDialog(
              context: context,
              builder: (context) =>
                  const Center(child: CircularProgressIndicator()));
        } else if (state is ErrorSignUpState) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        } else if (state is SuccessSignUpState) {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  OtpSingUpScreen(email: emailController.text),
            ),
          );
        }
      },
      child: InkWell(
        onTap: () async {
          context.read<AuthBloc>().add(SignUpEvent(
                emailController.text,
                passwordController.text,
              ));
        },
        child: CustomButtomBig(
            text: 'التالي', color: purple), // Make sure this widget is defined
      ),
    );
  }
}
