import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shamaa/screens/welcome_screen.dart';
import 'package:shamaa/style/custom_colors.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DeleteAccountScreen extends StatelessWidget {
  const DeleteAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: Text('حذف الحساب'),
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
            const SizedBox(height: 30),
            Image.asset("assets/16.png"),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Text(
                'كل ما تم حفظه، الدردشات، وسجل الدروس والمسابقات سوف يختفي للأبد.',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xFF3A3A3A),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  // حذف الحساب
                  onTap: () async {
                    try {
                      final client = Supabase.instance.client;
                      await client
                          .from('account')
                          .delete()
                          .eq('user_id', client.auth.currentUser?.id)
                          .execute();

                      // Delete the token from local storage
                      GetStorage authData = GetStorage('authLocalDataBase');

                      await client.auth.signOut();
                      // ignore: use_build_context_synchronously
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const WelcomeScreen()), // Replace with your screen
                        (route) => false,
                      );
                    } catch (e) {
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(
                                'Error deleting account: ${e.toString()}')),
                      );
                    }
                  },

                  child: Container(
                    width: 64,
                    height: 49,
                    padding: const EdgeInsets.all(10),
                    decoration: ShapeDecoration(
                      color: Color(0xFFEA4335),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Icon(
                      Icons.delete_outline_outlined,
                      color: white,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 264,
                    height: 49,
                    padding: const EdgeInsets.all(10),
                    decoration: ShapeDecoration(
                      color: Color(0xFFE4C1F9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'تراجـع',
                        style: TextStyle(
                          color: black,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
