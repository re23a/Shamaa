import 'package:flutter/material.dart';

class ListProfile extends StatelessWidget {
  const ListProfile({
    super.key,
    required this.txt,
    required this.iconLeading,
    required this.iconTrailing,
  });
  final String txt;
  final Icon iconLeading;
  final Widget iconTrailing;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        trailing: iconTrailing,
        leading: iconLeading,
        title: Text(
          txt,
          style: TextStyle(
            color: Color(0xFF3A3A3A),
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ));
  }
}
