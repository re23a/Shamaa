import 'package:flutter/material.dart';
import 'package:shamaa/screens/nav_bar.dart';
import 'package:shamaa/style/custom_colors.dart';
import 'package:shamaa/widgets/custom_bottoms.dart';
import 'package:shamaa/widgets/progress_bar.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  _CharacterScreenState createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  int selectedCharacterIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("إنشاء حساب"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const ProgressBar(progress: .996),
          const SizedBox(height: 28),
          _buildInstructionText(),
          const SizedBox(height: 24),
          _buildCharacterGrid(),
          const SizedBox(height: 104),
          _buildCreateAccountButton(context),
        ],
      ),
    );
  }

  Widget _buildInstructionText() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 28),
      child: Text(
        'الرجاء إختيار شخصيتك\nيمكنك تغييرها في اي وقت',
        textAlign: TextAlign.right,
        style: TextStyle(
          color: Color(0xFF3A3A3A),
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _buildCharacterGrid() {
    List<String> characters = [
      "assets/c1.png",
      "assets/c2.png",
      "assets/c3.png",
      "assets/c4.png",
      "assets/c5.png",
      "assets/c6.png",
      "assets/c7.png",
      "assets/c8.png",
      "assets/c9.png",
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        itemCount: characters.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 38,
          mainAxisSpacing: 18,
        ),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedCharacterIndex = index;
              });
            },
            child: Opacity(
              opacity: selectedCharacterIndex == index ? 1 : 0.5,
              child: Image.asset(characters[index]),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCreateAccountButton(BuildContext context) {
    return InkWell(
      onTap: () {
        if (selectedCharacterIndex != -1) {
          // Proceed with the selected character
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => NavBar()),
            (Route<dynamic> route) => false,
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('الرجاء اختيار شخصيتك'),
            duration: Duration(seconds: 2),
          ));
        }
      },
      child: CustomButtomBig(text: 'إنشاء الحساب', color: purple),
    );
  }
}
