import 'package:flutter/material.dart';
import 'package:fyfe/widgets/palette.dart';

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

class TextUtilProperty extends StatelessWidget {
  String title;
  Color? color;
  TextUtilProperty({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      "$title",
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
          fontWeight: FontWeight.w600, fontSize: 8, color: Palette.blue),
    );
  }
}
