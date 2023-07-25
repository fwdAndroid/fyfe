import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InsureTab extends StatefulWidget {
  const InsureTab({super.key});

  @override
  State<InsureTab> createState() => _InsureTabState();
}

class _InsureTabState extends State<InsureTab> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.4,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("insurance")
              .where("id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
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
                              isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                          .snapshots(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
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
                              trailing: Container(
                                padding: EdgeInsets.all(6.58),
                                decoration:
                                    BoxDecoration(color: Color(0xffDBDBDB)),
                                child: SvgPicture.asset("assets/pencil.svg"),
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
    );
  }
}
