import 'package:flutter/material.dart';
import 'package:shamaa/style/custom_colors.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset("assets/empty.png"),
          ),
          Text(
            'هذا القسم تحت الإنشاء',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            'تفضل بزيارتنا لاحقاً!',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
