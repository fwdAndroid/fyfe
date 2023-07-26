import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fyfe/widgets/custom_appbar.dart';
import 'package:fyfe/widgets/custom_drawer.dart';
import 'package:fyfe/widgets/drop.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Reports extends StatelessWidget {
  const Reports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var scaffoldkey = new GlobalKey<ScaffoldState>();
    TextEditingController searchController = TextEditingController();

    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: const Color(
          0xff3AC1CD,
        ),
        elevation: 0,
        title: const Text(
          "Reports",
          style: const TextStyle(
              color: Colors.white,
              fontFamily: "Nunito",
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
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
                  const SizedBox(
                    width: 22,
                  ),
                  SvgPicture.asset("assets/filter.svg")
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 400,
                margin: EdgeInsets.only(top: 10),
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("property")
                        .where("uid",
                            isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (BuildContext context, int index) {
                            final List<DocumentSnapshot> documents =
                                snapshot.data!.docs;
                            final Map<String, dynamic> data =
                                documents[index].data() as Map<String, dynamic>;
                            return Card(
                              child: ListTile(
                                trailing: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    "assets/Group.png",
                                    height: 25,
                                  ),
                                ),
                                title: Text(
                                  data['propertyPurchaseDate'],
                                  style: TextStyle(color: Colors.blue),
                                ),
                                subtitle: Text(
                                  "Type: Full Summary",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            );
                          });
                    }),
              ),
              Text(
                longText,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontSize: 10),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Create  Report",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    backgroundColor: Color(0xff71C598),
                    fixedSize: Size(350, 44)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
