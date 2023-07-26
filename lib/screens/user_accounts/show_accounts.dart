import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fyfe/screens/user_accounts/add_account.dart';
import 'package:fyfe/utils/controllers.dart';
import 'package:fyfe/utils/showsnak.dart';
import 'package:fyfe/utils/text_util.dart';
import 'package:fyfe/utils/textformfield.dart';
import 'package:fyfe/widgets/palette.dart';

class ShowAccounts extends StatefulWidget {
  const ShowAccounts({super.key});

  @override
  State<ShowAccounts> createState() => _ShowAccountsState();
}

class _ShowAccountsState extends State<ShowAccounts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: const Color(
          0xff3AC1CD,
        ),
        elevation: 0,
        title: const Text(
          "User Account",
          style: const TextStyle(
              color: Colors.white,
              fontFamily: "Nunito",
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (builder) => AddAccount()));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: SvgPicture.asset(
                "assets/addProperty.svg",
              ),
            ),
          ),
        ],
      ),
      body: Container(
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
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("accounts")
                  .where("id",
                      isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return StreamBuilder<Object>(
                          stream: FirebaseFirestore.instance
                              .collection("accounts")
                              .where("id",
                                  isEqualTo:
                                      FirebaseAuth.instance.currentUser!.uid)
                              .snapshots(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (!snapshot.hasData) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            if (snapshot.data!.docs.isEmpty) {
                              return const Center(
                                child: Text("No Account Found Find"),
                              );
                            }
                            final List<DocumentSnapshot> documents =
                                snapshot.data!.docs;
                            final Map<String, dynamic> data =
                                documents[index].data() as Map<String, dynamic>;

                            phoneAccountController.text = data['accountPhone'];
                            emailAccountController.text = data['accountEmail'];
                            addressAccountController.text =
                                data['accountAddress'];
                            return Column(
                              children: [
                                ListTile(
                                  title: Text(
                                    data['accountEmail'],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  subtitle: Text(
                                    data['accountPhone'],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  trailing: Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: Center(
                                                  child: TextUtil(
                                                    title:
                                                        'Update User Account"}',
                                                  ),
                                                ),
                                                content: SingleChildScrollView(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      const Text(
                                                        "* User Email",
                                                        style: TextStyle(
                                                            fontSize: 12),
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      TextFormInputField(
                                                        hintText:
                                                            "abc@gmail.com",
                                                        controller:
                                                            emailAccountController,
                                                        autovalidateMode:
                                                            AutovalidateMode
                                                                .onUserInteraction,
                                                        textInputType:
                                                            TextInputType
                                                                .emailAddress,
                                                      ),
                                                      const SizedBox(
                                                        height: 14,
                                                      ),
                                                      const Text(
                                                        "User Phone Number",
                                                        style: TextStyle(
                                                            fontSize: 12),
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      TextFormInputField(
                                                        controller:
                                                            phoneAccountController,
                                                        hintText: "125246577",
                                                        textInputType:
                                                            TextInputType
                                                                .number,
                                                      ),
                                                      const SizedBox(
                                                        height: 14,
                                                      ),
                                                      const Text(
                                                        "Address",
                                                        style: TextStyle(
                                                            fontSize: 12),
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      TextFormInputField(
                                                        controller:
                                                            addressAccountController,
                                                        autovalidateMode:
                                                            AutovalidateMode
                                                                .onUserInteraction,
                                                        textInputType:
                                                            TextInputType.text,
                                                        hintText:
                                                            "234 Eden Garden",
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                actions: <Widget>[
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: const Text(
                                                          "Cancel",
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                      ElevatedButton(
                                                        onPressed: () async {
                                                          await FirebaseFirestore
                                                              .instance
                                                              .collection(
                                                                  "accounts")
                                                              .doc(data['uuid'])
                                                              .update({
                                                            "accountAddress":
                                                                addressAccountController
                                                                    .text,
                                                            "accountEmail":
                                                                emailAccountController
                                                                    .text,
                                                            'accountPhone':
                                                                phoneAccountController
                                                                    .text
                                                          });
                                                          showSnakBar(
                                                              "User Accounts are updated",
                                                              context);
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                backgroundColor:
                                                                    Palette
                                                                        .green),
                                                        child: const Text(
                                                            "Update"),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(6.58),
                                          decoration: BoxDecoration(
                                              color: Color(0xffDBDBDB)),
                                          child: SvgPicture.asset(
                                              "assets/pencil.svg"),
                                        ),
                                      ),
                                      Expanded(
                                        child: IconButton(
                                            onPressed: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      title: Center(
                                                        child: TextUtil(
                                                          title:
                                                              'Delete Insurer"}',
                                                        ),
                                                      ),
                                                      content: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          const Text(
                                                            "Are you sure to delete this",
                                                            style: TextStyle(
                                                                fontSize: 12),
                                                          ),
                                                        ],
                                                      ),
                                                      actions: <Widget>[
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            TextButton(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: const Text(
                                                                "Cancel",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                              ),
                                                            ),
                                                            ElevatedButton(
                                                              onPressed:
                                                                  () async {
                                                                await FirebaseFirestore
                                                                    .instance
                                                                    .collection(
                                                                        "accounts")
                                                                    .doc(data[
                                                                        'uuid'])
                                                                    .delete();
                                                                showSnakBar(
                                                                    "User Account are Deleted",
                                                                    context);
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              style: ElevatedButton
                                                                  .styleFrom(
                                                                      backgroundColor:
                                                                          Palette
                                                                              .green),
                                                              child: const Text(
                                                                  "Delete"),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    );
                                                  });
                                            },
                                            icon: Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                                Divider()
                              ],
                            );
                          });
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
