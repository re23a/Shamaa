import 'package:flutter/material.dart';
import 'package:shamaa/screens/delete_account_screen.dart';
import 'package:shamaa/screens/update_account/updatea_ccs_creen.dart';
import 'package:shamaa/style/custom_colors.dart';
import 'package:shamaa/widgets/custom_bottoms.dart';

// ignore: must_be_immutable
class EditProfilScreen extends StatelessWidget {
  EditProfilScreen({super.key});
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
            Padding(
              padding: const EdgeInsets.only(top: 203),
              child: Image.asset("assets/o.png"),
            ),
            const SizedBox(
              height: 70,
            ),
            InkWell(
              onTap: () {
                // Logic to navigate to the Update Account Screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          UpdateAccScreen()), // Replace with your actual update screen
                );
              },
              child: CustomButtomBig(
                  text: "تحديث الحساب",
                  color: purple), // Replace lightGrey with your desired color
            ),
            const SizedBox(
              height: 12,
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
