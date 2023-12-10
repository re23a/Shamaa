import 'package:flutter/material.dart';
import 'package:shamaa/screens/sign_up/inf_acc_screen.dart';
import 'package:shamaa/style/custom_colors.dart';

class SwitchAccountScreen extends StatelessWidget {
  const SwitchAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: purple,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        title: const Text("تبديل الحساب"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Container(
              width: 335.92,
              height: 84,
              padding: const EdgeInsets.all(6),
              decoration: ShapeDecoration(
                color: Color(0xFFF7F7F9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Row(children: [
                Container(
                  width: 72,
                  height: 72,
                  decoration: const ShapeDecoration(
                    color: Colors.white,
                    shape: OvalBorder(
                      side: BorderSide(width: 0.69, color: Color(0xFF3A3A3A)),
                    ),
                  ),
                  child: Image.asset("assets/c3.png"),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'عبدالله محمد',
                      style: TextStyle(
                        color: black,
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    Text(
                      'الصف الثالث الابتدائي',
                      style: TextStyle(
                        color: black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  width: 30,
                ),
                Row(
                  children: [
                    Text(
                      '33',
                      style: TextStyle(
                        color: black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Image.asset("assets/yellow star.png")
                  ],
                )
              ]),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            width: 335.92,
            height: 84,
            padding: const EdgeInsets.all(6),
            decoration: ShapeDecoration(
              color: Color(0xFFF7F7F9),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InfAccScreen()));
                  },
                  child: Container(
                    width: 72,
                    height: 72,
                    decoration: const ShapeDecoration(
                      color: Colors.white,
                      shape: OvalBorder(
                        side: BorderSide(width: 0.69, color: Color(0xFF3A3A3A)),
                      ),
                    ),
                    child: Icon(Icons.add),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "اضافة حساب جديد",
                  style: TextStyle(
                    color: black,
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
