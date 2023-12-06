import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shamaa/blocs/onbaording_bloc/onbaording_bloc.dart';
import 'package:shamaa/blocs/onbaording_bloc/onbaording_event.dart';
import 'package:shamaa/blocs/onbaording_bloc/onbaording_state.dart';
import 'package:shamaa/screens/welcome_screen.dart';
import 'package:shamaa/style/custom_colors.dart';
import 'package:shamaa/widgets/custom_bottoms.dart';

class Onbaording extends StatelessWidget {
  const Onbaording({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 203),
                  child: BlocBuilder<OnbaordingBloc, OnbaordingState>(
                    builder: (context, state) {
                      if (state.index == 0) {
                        return Image.asset("assets/o.png");
                      } else if (state.index == 1) {
                        return Image.asset("assets/Group 632564.png");
                      } else if (state.index == 2) {
                        return Image.asset("assets/Celebrate.png");
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              BlocBuilder<OnbaordingBloc, OnbaordingState>(
                builder: (context, state) {
                  if (state.index == 0) {
                    return const OnbaordingText(
                        text1: 'مرحبًا بك في تطبيق',
                        text2: ' شمعة',
                        text3: 'حيث يتجسد عالم العلم والاكتشاف في راحة يديك');
                  } else if (state.index == 1) {
                    return const OnbaordingText(
                        text1: 'مساعدك الشخصي',
                        text2: '',
                        text3:
                            'مساعدنا شمعة بجانبك دائما لتسهيل رحلتك التعليمية');
                  } else if (state.index == 2) {
                    return const OnbaordingText(
                        text1: 'مسابقات يومية',
                        text2: '',
                        text3:
                            'تحديات جديدة يومية مع أصدقائك.. تضيء بفرصة للانتصار والتقدم');
                  } else {
                    return Container();
                  }
                },
              ),
              const SizedBox(
                height: 24,
              ),
              BlocBuilder<OnbaordingBloc, OnbaordingState>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleIndex(isActive: state.index == 0),
                      const SizedBox(width: 5),
                      CircleIndex(isActive: state.index == 1),
                      const SizedBox(width: 5),
                      CircleIndex(isActive: state.index == 2),
                      const SizedBox(width: 5),
                    ],
                  );
                },
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 29),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomBottom(
                      text: 'تخطي',
                      color: ExtraLightGrey,
                    ),
                    BlocBuilder<OnbaordingBloc, OnbaordingState>(
                      builder: (context, state) {
                        return InkWell(
                          onTap: () {
                            context
                                .read<OnbaordingBloc>()
                                .add(ChangeOnbaording(state.index));
                            if (state.index >= 2) {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const WelcomeScreen()),
                                (Route<dynamic> route) => false,
                              );
                            }
                          },
                          child: CustomBottom(
                            text: 'التالي',
                            color: purple,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CircleIndex extends StatelessWidget {
  const CircleIndex({
    super.key,
    required this.isActive,
  });
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12,
      height: 12,
      decoration: ShapeDecoration(
        color: isActive ? const Color(0xFFE4C1F9) : Colors.white,
        shape: const OvalBorder(
          side: BorderSide(width: 1, color: Color(0xFF3A3A3A)),
        ),
      ),
    );
  }
}

class OnbaordingText extends StatelessWidget {
  const OnbaordingText({
    super.key,
    required this.text1,
    required this.text2,
    required this.text3,
  });
  final String text1;
  final String text2;
  final String text3;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 27),
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: text1,
                  style: const TextStyle(
                    color: Color(0xFF3A3A3A),
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: text2,
                  style: const TextStyle(
                    color: Color(0xFFE4C1F9),
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 27,
          ),
          child: Text(
            text3,
            textAlign: TextAlign.right,
            style: const TextStyle(
              color: Color(0xFF3A3A3A),
              fontSize: 20,
              fontFamily: '.SF Arabic Rounded',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
