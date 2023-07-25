import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fyfe/screens/account/login_page.dart';
import 'package:fyfe/screens/all_properties/all_properties.dart';
import 'package:fyfe/screens/home/home_page.dart';
import 'package:fyfe/screens/reports/reports.dart';
import 'package:fyfe/widgets/palette.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer(
      {Key? key, this.user, this.userImage, required this.signOut})
      : super(key: key);
  final String? user;
  final String? userImage;
  final void Function()? signOut;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          // Important: Remove any padding from the ListView.

          children: [
            SizedBox(
              height: 73,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("assets/FYFE_Logo_Horizontal.png"),
                InkWell(
                  onTap: () {
                    Scaffold.of(context).closeDrawer();
                  },
                  child: SvgPicture.asset("assets/close.svg"),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                Scaffold.of(context).closeDrawer();
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => HomePage()));
              },
              child: Row(
                children: const [
                  SizedBox(
                    width: 26,
                  ),
                  Text(
                    "HOME",
                    style: TextStyle(color: Palette.blue, fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                SvgPicture.asset("assets/property.svg"),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  "PROPERTY",
                  style: TextStyle(color: Palette.blue, fontSize: 16),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            InkWell(
              onTap: () {
                Scaffold.of(context).closeDrawer();
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => AllProperties()));
              },
              child: Row(
                children: const [
                  SizedBox(
                    width: 26,
                  ),
                  Text("All properties"),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            InkWell(
              onTap: () {
                Scaffold.of(context).closeDrawer();
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => Reports()));
              },
              child: Row(
                children: const [
                  SizedBox(
                    width: 26,
                  ),
                  Text("Reports"),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            InkWell(
              onTap: () {
                Scaffold.of(context).closeDrawer();
                // Get.offNamedUntil(
                //   "/mapPage",
                //   (route) {
                //     return route.settings.name == "/home";
                //   },
                // );
              },
              child: Row(
                children: const [
                  SizedBox(
                    width: 26,
                  ),
                  Text("Map"),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              children: [
                SvgPicture.asset("assets/finance.svg"),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  "Finance",
                  style: TextStyle(color: Palette.blue, fontSize: 16),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            InkWell(
              onTap: () {
                Scaffold.of(context).closeDrawer();
                // Get.offNamedUntil(
                //   "/accounts",
                //   (route) {
                //     return route.settings.name == "/home";
                //   },
                // );
              },
              child: Row(
                children: const [
                  SizedBox(
                    width: 26,
                  ),
                  Text("Accounts"),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            InkWell(
              onTap: () {
                Scaffold.of(context).closeDrawer();
                // Get.offNamedUntil(
                //   "/superannuation",
                //   (route) {
                //     return route.settings.name == "/home";
                //   },
                // );
              },
              child: Row(
                children: const [
                  SizedBox(
                    width: 26,
                  ),
                  Text("Superannuation"),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            InkWell(
              onTap: () {
                Scaffold.of(context).closeDrawer();
                // Get.offNamedUntil(
                //   "/will",
                //   (route) {
                //     return route.settings.name == "/home";
                //   },
                // );
              },
              child: Row(
                children: const [
                  SizedBox(
                    width: 26,
                  ),
                  Text("Will"),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            InkWell(
              onTap: () {
                Scaffold.of(context).closeDrawer();
                // Get.offNamedUntil(
                //   "/insurance",
                //   (route) {
                //     return route.settings.name == "/home";
                //   },
                // );
              },
              child: Row(
                children: const [
                  SizedBox(
                    width: 26,
                  ),
                  Text("Insurance"),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              children: [
                SvgPicture.asset("assets/other.svg"),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  "Other",
                  style: TextStyle(color: Palette.blue, fontSize: 16),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            InkWell(
              onTap: () {
                Scaffold.of(context).closeDrawer();
                // Get.offNamedUntil(
                //   "/allContacts",
                //   (route) {
                //     return route.settings.name == "/home";
                //   },
                // );
              },
              child: Row(
                children: const [
                  SizedBox(
                    width: 26,
                  ),
                  Text("Contacts"),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            InkWell(
              onTap: () {
                Scaffold.of(context).closeDrawer();
                // Get.offNamedUntil(
                //   "/alerts",
                //   (route) {
                //     return route.settings.name == "/home";
                //   },
                // );
              },
              child: Row(
                children: const [
                  SizedBox(
                    width: 26,
                  ),
                  Text("Alerts"),
                ],
              ),
            ),
            Spacer(),
            Row(
              children: [
                userImage != null
                    ? Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3)),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Image.network(
                          userImage!,
                          width: 45,
                          height: 45,
                        ))
                    : SvgPicture.asset("assets/profile.svg"),
                SizedBox(
                  width: 9,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(user ?? ""),
                    InkWell(
                      onTap: () {
                        signOut!();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => AccountPage()));
                        //  Get.until((route) => route.settings.name == "/login");
                      },
                      child: Text(
                        "Log out",
                        style: TextStyle(color: Color(0xffCD2D2D)),
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 59,
            )
          ],
        ),
      ),
    );
  }
}
