import 'package:flutter/material.dart';
import 'package:shamaa/screens/settings_screen.dart';
import 'package:shamaa/screens/welcome_screen.dart';
import 'package:shamaa/style/custom_colors.dart';

import 'package:shamaa/widgets/profile_wiget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
          title: Text("الحساب الشخصي"),
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SettingsScreen()));
                  },
                  child: Icon(Icons.settings)),
            )
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 28),
              child: Row(
                children: [
                  Container(
                    width: 92.15,
                    height: 34.15,
                    decoration: ShapeDecoration(
                      color: purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.62),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'تبديل الحساب',
                        style: TextStyle(
                          color: black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Column(
                children: [
                  Container(
                    width: 147,
                    height: 147,
                    decoration: const ShapeDecoration(
                      color: Colors.white,
                      shape: OvalBorder(
                        side: BorderSide(width: 0.69, color: Color(0xFF3A3A3A)),
                      ),
                    ),
                    child: Image.asset("assets/26.png"),
                  ),
                  Text(
                    'عبدالله محمد',
                    style: TextStyle(
                      color: black,
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    'الصف الثالث الابتدائي',
                    style: TextStyle(
                      color: black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '13',
                        style: TextStyle(
                          color: black,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Image.asset("assets/yellow star.png"),
                    ],
                  ),
                ],
              ),
            ),
            DefaultTabController(
              length: 2,
              child: Column(children: [
                TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelStyle: TextStyle(
                    color: purple,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  labelColor: purple,
                  unselectedLabelColor: grey,
                  indicatorWeight: 4,
                  indicatorColor: purple,
                  tabs: [
                    Tab(text: "الدروس والمسابقات"),
                    Tab(text: "المراجع"),
                  ],
                ),
                // TabBarView(children: [])
              ]),
            ),
          ],
        ));
  }
}
