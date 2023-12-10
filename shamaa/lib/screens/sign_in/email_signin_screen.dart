import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shamaa/blocs/auth_bloc/auth_bloc_bloc.dart';
import 'package:shamaa/blocs/auth_bloc/auth_bloc_event.dart';
import 'package:shamaa/blocs/auth_bloc/auth_bloc_state.dart';
import 'package:shamaa/screens/nav_bar.dart';
import 'package:shamaa/style/custom_colors.dart';
import 'package:shamaa/widgets/CoustomTextField.dart';
import 'package:shamaa/widgets/custom_bottoms.dart';
import 'package:shamaa/widgets/progress_bar.dart';

class SignInScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("تسجيل دخول"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const ProgressBar(progress: .5),
            const SizedBox(height: 28),
            _buildInstructionText(),
            const SizedBox(height: 24),
            CustomTextField(
              controller: emailController,
              hintText: "ادخل البريد الالكتروني",
              isPassword: false,
            ),
            const SizedBox(height: 24),
            CustomTextField(
              controller: passwordController,
              hintText: "ادخل كلمة المرور",
              isPassword: true,
            ),
            const SizedBox(height: 104),
            _buildNextButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildInstructionText() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 28),
      child: Text(
        'الرجاء إدخال البريد الالكتروني وكلمة المرور ',
        textAlign: TextAlign.right,
        style: TextStyle(
          color: Color(0xFF3A3A3A),
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _buildNextButton(BuildContext context) {
    return BlocListener<AuthBloc, AuthStates>(
        listener: (context, state) {
          if (state is LoadingLoginState) {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is ErrorLoginState) {
            Navigator.pop(context);

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          } else if (state is SuccessLoginState) {
            Navigator.pop(context);
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => NavBar()),
              (Route<dynamic> route) => false,
            );
          }
        },
        child: InkWell(
          onTap: () async {
            context.read<AuthBloc>().add(
                  LoginEvent(emailController.text, passwordController.text),
                );
          },
          child: CustomButtomBig(text: 'التالي', color: purple),
        ));
  }
}
