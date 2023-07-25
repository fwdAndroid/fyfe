import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fyfe/utils/showsnak.dart';
import 'package:fyfe/utils/text_util.dart';
import 'package:fyfe/widgets/palette.dart';

class Insurance extends StatefulWidget {
  const Insurance({super.key});

  @override
  State<Insurance> createState() => _InsuranceState();
}

class _InsuranceState extends State<Insurance> {
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
          "Insurance",
          style: const TextStyle(
              color: Colors.white,
              fontFamily: "Nunito",
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
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
        padding: const EdgeInsets.fromLTRB(21.0, 21.0, 21.0, 21.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("insurance")
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
                  height: MediaQuery.of(context).size.height / 1.4,
                  child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return StreamBuilder<Object>(
                          stream: FirebaseFirestore.instance
                              .collection("insurance")
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
                                child: Text("No Insurance Find"),
                              );
                            }
                            final List<DocumentSnapshot> documents =
                                snapshot.data!.docs;
                            final Map<String, dynamic> data =
                                documents[index].data() as Map<String, dynamic>;

                            return Column(
                              children: [
                                ListTile(
                                  title: Text(
                                    data['contactName'],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  subtitle: Text(
                                    data['contactNumber'],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  trailing: IconButton(
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: Center(
                                                  child: TextUtil(
                                                    title: 'Delete Insurer"}',
                                                  ),
                                                ),
                                                content: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
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
                                                                  "insurance")
                                                              .doc(data['uuid'])
                                                              .delete();
                                                          showSnakBar(
                                                              "Insuance are Deleted",
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
