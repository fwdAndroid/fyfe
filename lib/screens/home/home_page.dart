import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fyfe/widgets/custom_appbar.dart';
import 'package:fyfe/widgets/custom_drawer.dart';
import 'package:fyfe/widgets/palette.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;
  var scaffoldkey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      drawer: CustomDrawer(
        user: FirebaseAuth.instance.currentUser!.displayName,
        userImage: FirebaseAuth.instance.currentUser!.photoURL,
        signOut: GoogleSignIn().signOut,
      ),
      body: SafeArea(
          child: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(colors: [
            Color(
              0xff3AC1CD,
            ),
            Color(
              0xff3AC1CD,
            ),
            Color(
              0xff3AADC6,
            ),
            Color(
              0xff395CAA,
            )
          ], radius: 1.8, center: Alignment.topCenter),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: CustomAppbar(
                  title: "HOME",
                  trailing: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: SvgPicture.asset(
                        "assets/notif.svg",
                      ),
                    ),
                  ),
                  ontapLeading: () {
                    scaffoldkey.currentState?.openDrawer();
                  },
                ),
              ),
              Expanded(
                  child: isLoading
                      ? Center(
                          child: Image.asset("assets/loading.gif", width: 70),
                        )
                      : Column(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 46,
                                  ),
                                  SvgPicture.asset(
                                    "assets/frame.svg",
                                    width: MediaQuery.of(context).size.width,
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                ],
                              ),
                            ),
                            // controller.allPropertiesList.isEmpty
                            //   ?
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 18),
                                  child: Text(
                                    "Looks like you are just getting started. Let’s begin by adding some accounts or property",
                                    style: TextStyle(color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(
                                  height: 13,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        // controller.goToAddProperty();
                                      },
                                      child: Text("Add Property"),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Palette.green,
                                        padding: EdgeInsets.all(17),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        // controller.goToAddAccount();
                                      },
                                      child: Text("Add Account"),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Palette.green,
                                        padding: EdgeInsets.all(17),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            //  : SizedBox(),
                            SizedBox(
                              height: 50,
                            ),
                          ],
                        ))
            ],
          ),
        ),
      )),
    );
  }
}
