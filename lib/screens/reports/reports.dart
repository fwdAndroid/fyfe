import 'dart:io';

import 'package:fyfe/screens/reports/full_report.dart';
import 'package:fyfe/screens/reports/pdf_View.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fyfe/widgets/drop.dart';
import 'package:path_provider/path_provider.dart';

class Reports extends StatefulWidget {
  const Reports({Key? key}) : super(key: key);

  @override
  State<Reports> createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  String pdfPath = '';

  @override
  Widget build(BuildContext context) {
    var scaffoldkey = new GlobalKey<ScaffoldState>();
    TextEditingController searchController = TextEditingController();
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     if (pdfPath.isNotEmpty) {
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //           builder: (context) => PDFViewer(filePath: pdfPath),
      //         ),
      //       );
      //     } else {
      //       ScaffoldMessenger.of(context).showSnackBar(
      //         SnackBar(content: Text('Please generate the PDF report first.')),
      //       );
      //     }
      //   },
      //   child: Icon(Icons.picture_as_pdf),
      // ),
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
                                trailing: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (builder) => FullReport(
                                                  agentName: data['agentName'],
                                                  insure: data['insure'],
                                                  policyEndDate:
                                                      data['policyEndDate'],
                                                  policyObtainedDate: data[
                                                      'policyObtainedDate'],
                                                  loanAmount:
                                                      data['loanAmount'],
                                                  propertyPurchaseDate: data[
                                                      'propertyPurchaseDate'],
                                                  propertyLeaseStart: data[
                                                      'propertyLeaseStart'],
                                                  uuid: data['uuid'],
                                                  numberofbathrooms:
                                                      data['numberofbathrooms'],
                                                  numberofbeds:
                                                      data['numberofbeds'],
                                                  numberofcarparks:
                                                      data['numberofcarparks'],
                                                  policyNumber:
                                                      data['policyNumber'],
                                                  propertyAddress:
                                                      data['propertyAddress'],
                                                  propertyLeaseEnd:
                                                      data['propertyLeaseEnd'],
                                                  propertyPurchasePrice: data[
                                                      'propertyPurchasePrice'],
                                                  propertyRent:
                                                      data['propertyRent'],
                                                  propertyType:
                                                      data['propertyType'],
                                                  propertyValue:
                                                      data['propertyValue'],
                                                )));
                                    FocusScope.of(context).unfocus();
                                    // generateAndSavePDFReport();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      "assets/Group.png",
                                      height: 25,
                                    ),
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
            ],
          ),
        ),
      ),
    );
  }

  Future<void> generateAndSavePDFReport() async {
    List<Map<String, dynamic>> data = await fetchCollectionData();

    final pdf = pw.Document();

    pdf.addPage(pw.Page(
      build: (pw.Context context) {
        return pw.Center(
          child: pw.ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return pw.Text(data[index]
                  ['agentName']); // Customize the report content as needed
            },
          ),
        );
      },
    ));

    // Save the PDF file
    final String dir = (await getApplicationDocumentsDirectory()).path;
    final String path = '$dir/report.pdf';
    final File file = File(path);
    await file.writeAsBytes(await pdf.save());

    setState(() {
      pdfPath = path;
    });
  }

  Future<List<Map<String, dynamic>>> fetchCollectionData() async {
    List<Map<String, dynamic>> data = [];
    try {
      var snapshot =
          await FirebaseFirestore.instance.collection('property').get();

      data = snapshot.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      print("Error fetching data: $e");
    }
    return data;
  }
}
