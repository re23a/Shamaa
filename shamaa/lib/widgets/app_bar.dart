import 'package:flutter/material.dart';
import 'package:shamaa/style/custom_colors.dart';
import 'package:shamaa/widgets/containers_sheet.dart';

class ChatGPTBottom extends StatelessWidget {
  const ChatGPTBottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          backgroundColor: white,
          context: context,
          builder: (context) => SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            child: Center(
              child: Column(
                children: [
                  // Divider(thickness: 3),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '  شمعة راح يشرح لك اي شيء ويجاوب عل كل اسألتك',
                    style: TextStyle(
                      color: black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: ContainersSheet(
                            txt: 'محادثـة\nمبـاشـرة',
                            icon: Image.asset("assets/Vector.png"),
                          ),
                        ),
                        ContainersSheet(
                          txt: 'صـورة',
                          icon: Image.asset("assets/Group 632587.png"),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  ContainersSheet(
                      txt: "تسجيــل\nصوتـي",
                      icon: Image.asset("assets/Group.png")),

                  Padding(
                    padding: const EdgeInsets.only(left: 60),
                    child: Image.asset("assets/Group 632710.png"),
                  )
                ],
              ),
            ),
          ),
        );
      },
      child: Row(
        children: [
          SizedBox(
            width: 11,
          ),
          Image.asset("assets/Group 632579.png"),
        ],
      ),
    );
  }
}

////===========================================================
class title extends StatelessWidget {
  const title({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/Group 632577.png"),
            SizedBox(
              height: 5,
            ),
            Text(
              'مساعدك الشخصي ',
              style: TextStyle(
                color: black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
