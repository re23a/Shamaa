import 'package:flutter/material.dart';
import 'package:shamaa/style/custom_colors.dart';
import 'package:shamaa/widgets/app_bar.dart';

class LeaderboardsScreen extends StatelessWidget {
  const LeaderboardsScreen({super.key});

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
        leading: const ChatGPTBottom(),
        title: const title(),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 14,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 83,
                height: 83,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: OvalBorder(
                    side: BorderSide(width: 0.39, color: Color(0xFF3A3A3A)),
                  ),
                ),
                child: Image.asset("assets/c1.png"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("عبدالله محمد"),
                  SizedBox(
                    width: 5,
                  ),
                  Text("99"),
                  Image.asset("assets/text with three stars.png")
                ],
              ),
              Image.asset("assets/win.png"),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 29),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 57,
                      height: 57,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: OvalBorder(
                          side:
                              BorderSide(width: 0.39, color: Color(0xFF3A3A3A)),
                        ),
                      ),
                      child: Image.asset("assets/c1.png"),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text("عبدالله محمد")
                  ],
                ),
                Row(
                  children: [
                    Text("99"),
                    SizedBox(
                      width: 5,
                    ),
                    Image.asset("assets/6666.png")
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
