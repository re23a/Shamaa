import 'package:flutter/material.dart';
import 'package:shamaa/screens/nav_bar.dart';
import 'package:shamaa/style/custom_colors.dart';
import 'package:shamaa/widgets/custom_bottoms.dart';
import 'package:shamaa/widgets/progress_bar.dart';

class CharacterScreen extends StatelessWidget {
  const CharacterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          title: Text("إنشاء حساب"),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            ProgressBar(progress: 1),
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
                        'الرجاء إختيار شخصيتك',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xFF3A3A3A),
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "يمكنك تغييرها في اي وقت",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xFF3A3A3A),
                          fontSize: 18,
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 38,
                mainAxisSpacing: 18,
                // childAspectRatio: .80,
                shrinkWrap: true,
                children: [
                  Image.asset("assets/c1.png"),
                  Image.asset("assets/c2.png"),
                  Image.asset("assets/c3.png"),
                  Image.asset("assets/c4.png"),
                  Image.asset("assets/c5.png"),
                  Image.asset("assets/c6.png"),
                  Image.asset("assets/c7.png"),
                  Image.asset("assets/c8.png"),
                  Image.asset("assets/c9.png"),
                ],
              ),
            ),
            const SizedBox(
              height: 104,
            ),
            InkWell(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => NavBar()),
                    (Route<dynamic> route) => false,
                  );
                },
                child: CustomButtomBig(text: 'إنشاء الحساب', color: purple))
          ],
        ));
  }
}
