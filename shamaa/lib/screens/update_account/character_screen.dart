import 'package:flutter/material.dart';
import 'package:shamaa/model/account.dart';
import 'package:shamaa/screens/nav_bar.dart';
import 'package:shamaa/service/supabase_request.dart';
import 'package:shamaa/style/custom_colors.dart';
import 'package:shamaa/widgets/custom_bottoms.dart';
import 'package:shamaa/widgets/progress_bar.dart';
import 'package:intl/intl.dart';

class Update_character_screen extends StatefulWidget {
  const Update_character_screen(
      {super.key,
      required this.userName,
      required this.dateOfBirth,
      required this.grade,
      this.index});
  final String userName;
  final String dateOfBirth;
  final String grade;
  final int? index;

  @override
  _Update_character_screenState createState() =>
      _Update_character_screenState();
}

class _Update_character_screenState extends State<Update_character_screen> {
  int selectedCharacterIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("تحديث حساب"),
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
      onTap: () async {
        if (selectedCharacterIndex != -1) {
          final DateFormat format = DateFormat('yyyy/MM/dd');
          DateTime parsedDateOfBirth;
          try {
            parsedDateOfBirth = format.parse(widget.dateOfBirth);
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Invalid date format'),
              duration: Duration(seconds: 2),
            ));
            return;
          }
          try {
            DateTime parsedDateOfBirth = format.parse(widget.dateOfBirth);

            Account account = Account(
              name: widget.userName,
              dateOfBirth: parsedDateOfBirth,
              studentClass: widget.grade,
              creatureIndex: selectedCharacterIndex,
            );
            await updateAccount(account, widget.index);
          } catch (e) {
            // Handle error (show a message)
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Error updating account: ${e.toString()}'),
              duration: Duration(seconds: 2),
            ));
          }

          // Navigate to the next screen
          // ignore: use_build_context_synchronously
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => NavBar(
                      index: widget.index,
                    )),
            (Route<dynamic> route) => false,
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Please select a character'),
            duration: Duration(seconds: 2),
          ));
        }
      },
      child: CustomButtomBig(text: 'تحديث الحساب', color: purple),
    );
  }
}
