import 'package:flutter/material.dart';
import 'package:shamaa/screens/welcome_screen.dart';
import 'package:shamaa/style/custom_colors.dart';
import 'package:shamaa/widgets/custom_bottoms.dart';

// =======================screen 1==============================
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
                  child: Image.asset("assets/o.png"),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 27),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'مرحبًا بك في تطبيق',
                        style: TextStyle(
                          color: Color(0xFF3A3A3A),
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: ' شمعة',
                        style: TextStyle(
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
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 27,
                ),
                child: Text(
                  'حيث يتجسد عالم العلم والاكتشاف في راحة يديك',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Color(0xFF3A3A3A),
                    fontSize: 20,
                    fontFamily: '.SF Arabic Rounded',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 12,
                    height: 12,
                    decoration: const ShapeDecoration(
                      color: Colors.white,
                      shape: OvalBorder(
                        side: BorderSide(width: 1, color: Color(0xFF3A3A3A)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 12,
                    height: 12,
                    decoration: const ShapeDecoration(
                      color: Colors.white,
                      shape: OvalBorder(
                        side: BorderSide(width: 1, color: Color(0xFF3A3A3A)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 12,
                    height: 12,
                    decoration: const ShapeDecoration(
                      color: Color(0xFFE4C1F9),
                      shape: OvalBorder(
                        side: BorderSide(width: 1, color: Color(0xFF3A3A3A)),
                      ),
                    ),
                  ),
                ],
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
                    InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Onbaording2()),
                          (Route<dynamic> route) => false,
                        );
                      },
                      child: CustomBottom(
                        text: 'التالي',
                        color: purple,
                      ),
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

// =======================screen 2==============================
class Onbaording2 extends StatelessWidget {
  const Onbaording2({super.key});

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
                  child: Image.asset("assets/Group 632564.png"),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 27),
                child: Text(
                  'مرحبًا بك في تطبيق',
                  style: TextStyle(
                    color: Color(0xFF3A3A3A),
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 27,
                ),
                child: Text(
                  'مساعدنا شمعة بجانبك دائما لتسهيل رحلتك التعليمية',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Color(0xFF3A3A3A),
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 12,
                    height: 12,
                    decoration: const ShapeDecoration(
                      color: Colors.white,
                      shape: OvalBorder(
                        side: BorderSide(width: 1, color: Color(0xFF3A3A3A)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 12,
                    height: 12,
                    decoration: const ShapeDecoration(
                      color: Color(0xFFE4C1F9),
                      shape: OvalBorder(
                        side: BorderSide(width: 1, color: Color(0xFF3A3A3A)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 12,
                    height: 12,
                    decoration: const ShapeDecoration(
                      color: Colors.white,
                      shape: OvalBorder(
                        side: BorderSide(width: 1, color: Color(0xFF3A3A3A)),
                      ),
                    ),
                  ),
                ],
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
                    InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const GetStarted()),
                          (Route<dynamic> route) => false,
                        );
                      },
                      child: CustomBottom(
                        text: 'التالي',
                        color: purple,
                      ),
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

// =======================get started==============================
class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

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
                  child: Image.asset("assets/Celebrate.png"),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 27),
                child: Text(
                  'مسابقات يومية',
                  style: TextStyle(
                    color: Color(0xFF3A3A3A),
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 27,
                ),
                child: Text(
                  'تحديات جديدة يومية مع أصدقائك.. تضيء بفرصة للانتصار والتقدم',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Color(0xFF3A3A3A),
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 12,
                    height: 12,
                    decoration: const ShapeDecoration(
                      color: Color(0xFFE4C1F9),
                      shape: OvalBorder(
                        side: BorderSide(width: 1, color: Color(0xFF3A3A3A)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 12,
                    height: 12,
                    decoration: const ShapeDecoration(
                      color: Colors.white,
                      shape: OvalBorder(
                        side: BorderSide(width: 1, color: Color(0xFF3A3A3A)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 12,
                    height: 12,
                    decoration: const ShapeDecoration(
                      color: Colors.white,
                      shape: OvalBorder(
                        side: BorderSide(width: 1, color: Color(0xFF3A3A3A)),
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 29),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WelcomeScreen()),
                        (Route<dynamic> route) => false,
                      );
                    },
                    child: CustomButtomBig(
                      text: 'التالي',
                      color: purple,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
