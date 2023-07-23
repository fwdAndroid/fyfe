import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyfe/widgets/custom_drawer.dart';
import 'package:fyfe/widgets/add_property_form_widget.dart';
import 'package:fyfe/widgets/step_indicator.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AddProperty extends StatefulWidget {
  const AddProperty({super.key});

  @override
  State<AddProperty> createState() => _AddPropertyState();
}

class _AddPropertyState extends State<AddProperty> {
  var scaffoldkey = new GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(
          0xff3AC1CD,
        ),
        elevation: 0,
        title: const Text(
          "Add Property",
          style: const TextStyle(
              color: Colors.white,
              fontFamily: "Nunito",
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () {
            scaffoldkey.currentState?.openDrawer();
          },
        ),
      ),
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(child: StepIndicator(selected: 1)),
                  const SizedBox(
                    height: 18,
                  ),
                  const FormWidget(),
                ],
              ),
            )),
      ),
    );
  }
}
