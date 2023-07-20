import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final String icon;
  final void Function()? onTap;
  const CustomButton(
      {Key? key, required this.title, required this.icon, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
        decoration: BoxDecoration(
            color: const Color(0xffFFFFFF),
            borderRadius: BorderRadius.circular(100)),
        child: Row(
          children: [
            SvgPicture.asset("assets/$icon.svg"),
            const SizedBox(
              width: 25,
            ),
            Text(
              title,
              style: const TextStyle(
                  fontFamily: "SFProText",
                  fontWeight: FontWeight.w600,
                  fontSize: 17),
            ),
          ],
        ),
      ),
    );
  }
}
