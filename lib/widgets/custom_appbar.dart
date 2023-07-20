import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppbar extends StatelessWidget {
  final String title;
  // final String trailing;
  final void Function()? ontapLeading;
  final Widget trailing;
  // final void Function()? ontapTrailing;
  const CustomAppbar({
    Key? key,
    required this.title,
    // required this.trailing,
    required this.ontapLeading,
    required this.trailing,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: ontapLeading,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: SvgPicture.asset(
                "assets/menu.svg",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(
              title,
              style: const TextStyle(
                  color: Colors.white,
                  fontFamily: "Nunito",
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ),
          trailing,
        ],
      ),
    );
  }
}
