import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fyfe/screens/property/add_property.dart';
import 'package:fyfe/utils/text_util.dart';
import 'package:fyfe/widgets/custom_appbar.dart';
import 'package:fyfe/widgets/custom_drawer.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AllProperties extends StatefulWidget {
  const AllProperties({super.key});

  @override
  State<AllProperties> createState() => _AllPropertiesState();
}

class _AllPropertiesState extends State<AllProperties> {
  TextEditingController searchController = TextEditingController();
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
          padding: const EdgeInsets.fromLTRB(21.0, 21.0, 21.0, 21.0),
          child: Column(
            children: [
              CustomAppbar(
                title: "All properties",
                trailing: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => AddProperty()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    child: SvgPicture.asset(
                      "assets/addProperty.svg",
                    ),
                  ),
                ),
                ontapLeading: () {
                  scaffoldkey.currentState?.openDrawer();
                },
              ),
              const SizedBox(
                height: 18,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      onChanged: (value) {},
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Search",
                          hintStyle: TextStyle(
                              color: Color(0xffD7D7D7),
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                  // const SizedBox(
                  //   width: 22,
                  // ),
                  // SvgPicture.asset("assets/filter.svg")
                ],
              ),

              const SizedBox(
                height: 13,
              ),
              Expanded(
                  child: Center(
                child: Text(
                    "Looks like you are just getting started. Let’s begin by adding some property",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center),
              ))

              // GetBuilder<AllPropertiesController>(builder: (_) {
              //   return controller.loading
              //       ? Center(
              //           child: Image.asset("assets/loading.gif", width: 70),
              //         )
              //       : controller.allPropertiesList.isEmpty
              //           ? Center(
              //               child: Text(
              //                   "Looks like you are just getting started. Let’s begin by adding some property",
              //                   style: TextStyle(
              //                     color: Colors.white,
              //                   ),
              //                   textAlign: TextAlign.center),
              //             )
              //           : GridView.count(
              //               crossAxisCount: 2,
              //               mainAxisSpacing: 12,
              //               crossAxisSpacing: 16,
              //               childAspectRatio: 0.81,
              //               children: controller.searchList
              //                   .map(
              //                     (e) => InkWell(
              //                       onTap: () {
              //                         Get.toNamed("/propertyDetails",
              //                                 arguments: e)
              //                             ?.then((value) {
              //                           controller.getProperties();
              //                         });
              //                       },
              //                       child: PropertyItem(
              //                         model: e,
              //                       ),
              //                     ),
              //                   )
              //                   .toList(),
              //             );
            ],
          ),
        ),
      ),
    );
  }
}
