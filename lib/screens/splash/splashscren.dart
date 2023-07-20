import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fyfe/screens/account/login_page.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => AccountPage())));
  }

  @override
  Widget build(BuildContext context) {
    bool animation = false;

    return Scaffold(
      body: Shimmer(
          child: Stack(
        children: [
          Image.asset(
            "assets/1.png",
            fit: BoxFit.fill,
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
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 550,
                          child: AnimatedAlign(
                            alignment: animation == false
                                ? Alignment.center
                                : Alignment.bottomCenter,

                            // If the widget is visible, animate to 0.0 (invisible).
                            // If the widget is hidden, animate to 1.0 (fully visible).
                            duration: const Duration(milliseconds: 2000),
                            curve: Curves.slowMiddle,
                            child: SizedBox(
                              height: 134,
                              child: Image.asset(
                                "assets/FYFE_Logo_Package/Vertical/FYFE_Logo_Vertical_White.png",
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
