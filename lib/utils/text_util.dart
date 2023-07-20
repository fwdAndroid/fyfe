import 'package:flutter/material.dart';

class TextUtil extends StatelessWidget {
  String title;
  TextUtil({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      "$title",
      style: TextStyle(
          fontFamily: "Roboto",
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold),
    );
  }
}
