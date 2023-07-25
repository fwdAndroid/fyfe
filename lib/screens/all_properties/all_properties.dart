import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fyfe/screens/all_properties/show_properties.dart';
import 'package:fyfe/screens/property/add_property.dart';
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
                ],
              ),
              const SizedBox(
                height: 13,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 1.4,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
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
                      if (snapshot.hasData) {
                        return GridView.count(
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          crossAxisCount: 2,
                          mainAxisSpacing: 20.0,
                          childAspectRatio: 19 / 25,
                          crossAxisSpacing: 20.0,
                          children: snapshot.data!.docs.map((document) {
                            return Card(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (builder) => ShowProperties(
                                                rent: document['propertyRent'],
                                                purchasedate: document[
                                                    'propertyPurchaseDate'],
                                                propertyValue:
                                                    document['propertyValue'],
                                                policystart: document[
                                                    'policyObtainedDate'],
                                                policyend:
                                                    document['policyEndDate'],
                                                insure: document['insure'],
                                                agent: document['agentName'],
                                                propertyPrice: document[
                                                    'propertyPurchasePrice'],
                                                loanamount:
                                                    document['loanAmount'],
                                                leaseend: document[
                                                    'propertyLeaseEnd'],
                                                leaseStart: document[
                                                    'propertyLeaseStart'],
                                                carparks: document[
                                                    'numberofcarparks'],
                                                beds: document['numberofbeds'],
                                                bathrooms: document[
                                                    'numberofbathrooms'],
                                                images: document["photo"])));
                                  },
                                  child: Container(
                                    height: 120,
                                    width: MediaQuery.of(context).size.width,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.network(
                                        document['photo'][0],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    document['propertyAddress'],
                                    style: TextStyle(
                                        color: Color(0xff395CAA),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.5, right: 14),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        document["propertyPurchasePrice"]
                                            .toString(),
                                        style: const TextStyle(
                                            color: Color(0xff858585),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 8),
                                      ),
                                      SvgPicture.asset("assets/enter.svg"),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.5, right: 14),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset("assets/bed.svg"),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        document['numberofbeds'],
                                        style: TextStyle(
                                            color: Color(0xffC5C5C5),
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        " | ",
                                        style: TextStyle(
                                            color: Color(0xffB1B1B1),
                                            fontWeight: FontWeight.w300),
                                      ),
                                      SvgPicture.asset("assets/bath.svg"),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        document['numberofbathrooms'],
                                        style: TextStyle(
                                            color: Color(0xffC5C5C5),
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        " | ",
                                        style: TextStyle(
                                            color: Color(0xffB1B1B1),
                                            fontWeight: FontWeight.w300),
                                      ),
                                      SvgPicture.asset("assets/car.svg"),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        document['numberofcarparks'],
                                        style: TextStyle(
                                            color: Color(0xffC5C5C5),
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ));
                          }).toList(),
                        );
                      }
                      return const Center(
                        child: Text(
                          "No Property is Listed",
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
