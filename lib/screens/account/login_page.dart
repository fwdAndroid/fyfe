import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fyfe/widgets/custom_button.dart';
import 'package:auto_size_text/auto_size_text.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              "assets/2.png",
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                backgroundBlendMode: BlendMode.modulate,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 255, 255, 255),
                    Color.fromARGB(255, 255, 255, 255),
                    // Color.fromARGB(255, 255, 255, 255),

                    // Color.fromARGB(170, 58, 193, 208),
                    Color(0xff3ac1cd),
                    Color(0xff395caa),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Column(
                  children: [
                    SizedBox(
                      height: 103,
                      child: Image.asset(
                        "assets/FYFE_Logo_Package/Vertical/FYFE_Logo_Vertical_White.png",
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    SizedBox(
                      height: 43,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: CustomButton(
                        title: "Continue with Google",
                        icon: "google",
                        onTap: () {},
                      ),
                    ),
                    if (Platform.isIOS)
                      const SizedBox(
                        height: 12,
                      ),
                    if (Platform.isIOS)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: CustomButton(
                          title: "Continue with Apple",
                          icon: "apple",
                          onTap: () {},
                        ),
                      ),
                    const SizedBox(
                      height: 70,
                    ),
                    AutoSizeText(
                      "By creating an account or signing you agree to our",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "SfProText",
                          fontSize: 13),
                      maxLines: 1,
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Row(
                                  children: [
                                    Text("Terms and Conditions"),
                                    Spacer(),
                                    InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child:
                                          SvgPicture.asset("assets/close.svg"),
                                    )
                                  ],
                                ),
                                content: Text(
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
                              );
                            });
                      },
                      child: const Text(
                        "Terms and Conditions.",
                        style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                            fontFamily: "SfProText",
                            fontSize: 13,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
