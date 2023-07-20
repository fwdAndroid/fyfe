import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyfe/widgets/custom_appbar.dart';
import 'package:fyfe/widgets/palette.dart';
import 'package:fyfe/widgets/step_indicator.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../widgets/custom_drawer.dart';

class AddPropertyImage extends StatefulWidget {
  const AddPropertyImage({super.key});

  @override
  State<AddPropertyImage> createState() => _AddPropertyImageState();
}

class _AddPropertyImageState extends State<AddPropertyImage> {
  var scaffoldkey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          padding: const EdgeInsets.fromLTRB(
            20.0,
            20.0,
            20.0,
            0.0,
          ),
          child: Column(
            children: [
              CustomAppbar(
                title: "Add Photo",
                trailing: SizedBox(
                  width: 30,
                ),
                ontapLeading: () {
                  scaffoldkey.currentState?.openDrawer();
                },
              ),
              const SizedBox(
                height: 18,
              ),
              StepIndicator(selected: 2),
              const SizedBox(
                height: 18,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Palette.green,
                      padding: const EdgeInsets.symmetric(vertical: 17),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: const Text(
                    "Upload Property Photo",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Mulish",
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),

              const SizedBox(
                height: 19,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    // controller.addPhotoUrlToProperty();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Palette.blue,
                      padding: const EdgeInsets.symmetric(vertical: 17),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: const Text(
                    "Submit",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Mulish",
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),

              const SizedBox(
                height: 19,
              ),
              // Expanded(
              //   child: GetBuilder<AddPhotoController>(builder: (_) {
              //     return controller.loading
              //         ? Center(
              //             child: Image.asset("assets/loading.gif", width: 70),
              //           )
              //         : SingleChildScrollView(
              //             child: GridView.count(
              //               crossAxisCount: 3,
              //               shrinkWrap: true,
              //               crossAxisSpacing: 5,
              //               mainAxisSpacing: 5,
              //               childAspectRatio: 1,
              //               children: controller.imageList
              //                   .map(
              //                     (e) => Container(
              //                       decoration: BoxDecoration(
              //                           color: Colors.grey,
              //                           borderRadius:
              //                               BorderRadius.circular(10)),
              //                       clipBehavior: Clip.antiAliasWithSaveLayer,
              //                       child: Stack(
              //                         children: [
              //                           Positioned.fill(
              //                             bottom: 0,
              //                             top: 0,
              //                             child: Align(
              //                               alignment: Alignment.center,
              //                               child: Image.file(
              //                                 File(e.localImage.path),
              //                                 height: 200,
              //                                 fit: BoxFit.fitHeight,
              //                               ),
              //                             ),
              //                           ),
              //                           Positioned(
              //                             top: 0,
              //                             right: 0,
              //                             child: InkWell(
              //                               onTap: () =>
              //                                   controller.deletePhoto(e),
              //                               child: Container(
              //                                 decoration: const BoxDecoration(
              //                                     color: Colors.white),
              //                                 child: const Icon(Icons.clear),
              //                               ),
              //                             ),
              //                           ),
              //                           if (e.url == null)
              //                             Positioned(
              //                               top: 0,
              //                               left: 0,
              //                               right: 0,
              //                               bottom: 0,
              //                               child: Container(
              //                                 decoration: BoxDecoration(
              //                                     color: Colors.black
              //                                         .withOpacity(0.6)),
              //                                 child: CircularPercentIndicator(
              //                                   radius: 20,
              //                                   percent: e.progress,
              //                                 ),
              //                               ),
              //                             )
              //                         ],
              //                       ),
              //                     ),
              //                   )
              //                   .toList(),
              //             ),
              //           );
              //   }),
              // )
            ],
          ),
        ),
      )),
    );
  }
}
