import 'package:flutter/material.dart';
import 'package:shamaa/screens/delete_account_screen.dart';
import 'package:shamaa/style/custom_colors.dart';
import 'package:shamaa/widgets/CoustomTextField.dart';
import 'package:shamaa/widgets/custom_bottoms.dart';

class EditProfilScreen extends StatelessWidget {
  EditProfilScreen({super.key});
  // DateTime dateTime = DateTime.now();
  // final dateController = TextEditingController();
  // final gradeController = TextEditingController();
  // final userNameController = TextEditingController();
  String? selectedGrade;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: Text("اعدادات الحساب الشخصي"),
        backgroundColor: purple,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DeleteAccountScreen()));
                },
                child: CustomButtomBig(text: "حذف الحساب", color: lightGrey))
          ],
        ),
      ),
    );
  }
}
