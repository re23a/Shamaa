import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shamaa/blocs/auth_bloc/auth_bloc_bloc.dart';
import 'package:shamaa/blocs/auth_bloc/auth_bloc_event.dart';
import 'package:shamaa/blocs/auth_bloc/auth_bloc_state.dart';
import 'package:shamaa/screens/sign_up/inf_acc_screen.dart';
import 'package:shamaa/style/custom_colors.dart';
import 'package:shamaa/widgets/CoustomTextField.dart';
import 'package:shamaa/widgets/custom_bottoms.dart';
import 'package:shamaa/widgets/progress_bar.dart';

class OtpSingUpScreen extends StatelessWidget {
  final TextEditingController otpController = TextEditingController();
  final String email;

  OtpSingUpScreen({super.key, required this.email});

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
            const ProgressBar(progress: 0.332), // Ensure this widget is defined
            const SizedBox(height: 28),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'الرجاء إدخال رمز التحقق',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFF3A3A3A),
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    'تم إرسال رمز التحقق الى ${email.replaceAll(RegExp(r'.(?=.{3})'), '*')}',
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      color: Color(0xFF3A3A3A),
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            CustomTextField(
              controller: otpController,
              hintText: "ادخل رمز التحقق",
              isPassword: false,
            ),
            const SizedBox(height: 104),
            _buildSubmitButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return BlocListener<AuthBloc, AuthStates>(
      listener: (context, state) {
        if (state is LoadingOtpState) {
          showDialog(
            context: context,
            builder: (context) =>
                const Center(child: CircularProgressIndicator()),
          );
        } else {
          Navigator.of(context).pop();
          if (state is ErrorOtpState) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is SuccessOtpState) {
            Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => InfAccScreen()));
          }
        }
      },
      child: InkWell(
        onTap: () {
          context.read<AuthBloc>().add(OTPEvent(otpController.text, email));
        },
        child: CustomButtomBig(
            text: 'التالي', color: purple), // Ensure this widget is defined
      ),
    );
  }
}
