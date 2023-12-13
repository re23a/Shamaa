import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shamaa/blocs/account_bloc/account_bloc_bloc.dart';
import 'package:shamaa/model/account.dart';
import 'package:shamaa/screens/nav_bar.dart';
import 'package:shamaa/style/custom_colors.dart';
import 'package:shamaa/widgets/custom_bottoms.dart';
import 'package:shamaa/widgets/progress_bar.dart';
import 'package:intl/intl.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen(
      {super.key,
      required this.userName,
      required this.dateOfBirth,
      required this.grade});
  final String userName;
  final String dateOfBirth;
  final String grade;
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
          // Parsing the dateOfBirth string to DateTime object
          final DateFormat format = DateFormat('yyyy/MM/dd');
          DateTime parsedDateOfBirth;
          try {
            parsedDateOfBirth = format.parse(widget.dateOfBirth);
          } catch (e) {
            // Handle the error or show a message if the date format is incorrect
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Invalid date format'),
              duration: Duration(seconds: 2),
            ));
            return;
          }

          // Creating a new Account object
          final Account newAccount = Account(
            userId: context
                .read<AccountBlocBloc>()
                .supabaseClient
                .auth
                .currentUser!
                .id, // Assuming this method exists and gets the current user's ID
            name: widget.userName,
            dateOfBirth: parsedDateOfBirth,
            studentClass: widget.grade,
            creatureIndex: selectedCharacterIndex,
            stars: 0, // Assuming default stars value is 0
          );

          // Dispatching CreateAccountEvent
          context
              .read<AccountBlocBloc>()
              .add(CreateAccountEvent(account: newAccount));
          showDialog(
              barrierColor: Colors.transparent,
              context: context,
              builder: (context) {
                // here change
                return Center(
                  child: Container(
                    width: 333,
                    height: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30), color: white),
                    child: Column(
                      children: [
                        Image.asset("assets/Group 632648.png"),
                        Center(
                          child: Text(
                            'تم إنشاء الحساب بنجـاح',
                            style: TextStyle(
                              color: green,
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              });
          // Navigate to the next screen
          Future.delayed(Duration(seconds: 3), () {
            Navigator.pop(context);
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      NavBar()), // Replace with your desired screen
              (Route<dynamic> route) => false,
            );
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Please select a character'),
            duration: Duration(seconds: 2),
          ));
        }
      },
      child: CustomButtomBig(text: 'إنشاء الحساب', color: purple),
    );
  }
}
