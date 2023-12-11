import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shamaa/screens/update_account/character_screen.dart';
import 'package:shamaa/style/custom_colors.dart';
import 'package:shamaa/widgets/CoustomTextField.dart';
import 'package:shamaa/widgets/custom_bottoms.dart';
import 'package:shamaa/widgets/progress_bar.dart';
import 'package:intl/intl.dart';

class UpdateAccScreen extends StatefulWidget {
  const UpdateAccScreen({super.key});

  @override
  State<UpdateAccScreen> createState() => _UpdateAccScreenState();
}

class _UpdateAccScreenState extends State<UpdateAccScreen> {
  DateTime dateTime = DateTime.now();
  final dateController = TextEditingController();
  final gradeController = TextEditingController();
  final userNameController = TextEditingController();
  String? selectedGrade;
  @override
  void initState() {
    super.initState();
    dateController.text = DateFormat('yyyy/MM/dd').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    const List<String> grades = [
      'الصف الأول الابتدائي',
      'الصف الثاني الابتدائي',
      'الصف الثالث الابتدائي',
      'الصف الرابع الابتدائي',
      'الصف الخامس الابتدائي',
      'الصف السادس الابتدائي',
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("تحديث حساب"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const ProgressBar(progress: 0.83),
            const SizedBox(height: 28),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 28),
              child: Text(
                'خطوات بسيطه ويكون حسابك جاهز',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xFF3A3A3A),
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: 25),
            CustomTextField(
              controller: userNameController,
              hintText: "ادخل اسمك هنا",
              isPassword: false,
            ),
            const SizedBox(height: 25),
            buildDatePicker(),
            const SizedBox(height: 25),
            _buildGradeDropdown(grades),
            const SizedBox(height: 104),
            _buildNextButton(context),
          ],
        ),
      ),
    );
  }

  Widget buildDatePicker() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: InkWell(
          onTap: () => _selectDate(context),
          child: InputDecorator(
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              hintText: 'ادخل تاريخ الميلاد',
            ),
            child: Text(dateController.text),
          ),
        ),
      );
  Future<void> _selectDate(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return Container(
          height: MediaQuery.of(context).copyWith().size.height / 3,
          width: MediaQuery.of(context).copyWith().size.width / 2,
          child: CupertinoDatePicker(
            minimumYear: 2000,
            maximumYear: DateTime.now().year,
            initialDateTime: dateTime,
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: (newDateTime) {
              setState(() {
                dateTime = newDateTime;
                dateController.text = DateFormat('yyyy/MM/dd').format(dateTime);
                print(dateController.text);
              });
            },
          ),
        );
      },
    );
  }

  Widget _buildGradeDropdown(List<String> grades) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          filled: true,
          fillColor: ExtraLightGrey,
        ),
        value: selectedGrade,
        hint: Text('اختر الصف الدراسي'),
        onChanged: (String? newValue) {
          setState(() {
            selectedGrade = newValue;
            gradeController.text = newValue ?? '';
            //  print(gradeController);
          });
        },
        items: grades.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildNextButton(BuildContext context) {
    return InkWell(
      onTap: () {
        if (userNameController.text.isEmpty) {
          _showSnackBar(context, 'الرجاء إدخال اسمك');
        } else if (selectedGrade == null || selectedGrade!.isEmpty) {
          _showSnackBar(context, 'الرجاء اختيار الصف الدراسي');
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Update_character_screen(
                      userName: userNameController.text,
                      dateOfBirth: dateController.text,
                      grade: selectedGrade!,
                    )),
          );
        }
      },
      child: CustomButtomBig(text: 'التالي', color: purple),
    );
  }
}

void _showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: Duration(seconds: 2),
    ),
  );
}
