import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fyfe/utils/controllers.dart';
import 'package:fyfe/utils/showsnak.dart';
import 'package:fyfe/utils/text_util.dart';
import 'package:fyfe/utils/textformfield.dart';
import 'package:fyfe/widgets/palette.dart';

class AgentTab extends StatefulWidget {
  const AgentTab({super.key});

  @override
  State<AgentTab> createState() => _AgentTabState();
}

class _AgentTabState extends State<AgentTab> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.4,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("agents")
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
                          .collection("agents")
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
                            child: Text("No Agent Find"),
                          );
                        }
                        final List<DocumentSnapshot> documents =
                            snapshot.data!.docs;
                        final Map<String, dynamic> data =
                            documents[index].data() as Map<String, dynamic>;

                        agentTabNameControllers.text = data['contactName'];
                        agentTabCompanyControllers.text = data['companyName'];
                        agentTabNumbersControllers.text = data['agentNumber'];
                        agentTabEmailControllers.text = data['agentEmail'];
                        agentTabAddresslControllers.text = data['address'];
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
                                data['companyName'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                              trailing: InkWell(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Center(
                                          child: TextUtil(
                                            title: 'Update Agent"}',
                                          ),
                                        ),
                                        content: SingleChildScrollView(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const Text(
                                                "* Contact Name",
                                                style: TextStyle(fontSize: 12),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              TextFormInputField(
                                                hintText: "Melanie Smith",
                                                controller:
                                                    agentTabNameControllers,
                                                autovalidateMode:
                                                    AutovalidateMode
                                                        .onUserInteraction,
                                                textInputType:
                                                    TextInputType.text,
                                              ),
                                              const SizedBox(
                                                height: 14,
                                              ),
                                              const Text(
                                                "Company",
                                                style: TextStyle(fontSize: 12),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              TextFormInputField(
                                                controller:
                                                    agentTabCompanyControllers,
                                                hintText: "Company Name",
                                                textInputType:
                                                    TextInputType.text,
                                              ),
                                              const SizedBox(
                                                height: 14,
                                              ),
                                              const Text(
                                                "* Number",
                                                style: TextStyle(fontSize: 12),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              TextFormInputField(
                                                controller:
                                                    agentTabNumbersControllers,
                                                autovalidateMode:
                                                    AutovalidateMode
                                                        .onUserInteraction,
                                                textInputType:
                                                    TextInputType.number,
                                                hintText: "Number",
                                              ),
                                              const SizedBox(
                                                height: 14,
                                              ),
                                              const Text(
                                                "* Email",
                                                style: TextStyle(fontSize: 12),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              TextFormInputField(
                                                controller:
                                                    agentTabEmailControllers,
                                                autovalidateMode:
                                                    AutovalidateMode
                                                        .onUserInteraction,
                                                textInputType:
                                                    TextInputType.emailAddress,
                                                hintText: "Email",
                                              ),
                                              const SizedBox(
                                                height: 14,
                                              ),
                                              const Text(
                                                "Address",
                                                style: TextStyle(fontSize: 12),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              TextFormInputField(
                                                  controller:
                                                      agentTabAddresslControllers,
                                                  hintText: "Address",
                                                  textInputType:
                                                      TextInputType.text)
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
                                                  Navigator.pop(context);
                                                },
                                                child: const Text(
                                                  "Cancel",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                              ElevatedButton(
                                                onPressed: () async {
                                                  await FirebaseFirestore
                                                      .instance
                                                      .collection("agents")
                                                      .doc(data['uuid'])
                                                      .update({
                                                    "contactName":
                                                        agentTabNameControllers
                                                            .text,
                                                    "companyName":
                                                        agentTabCompanyControllers
                                                            .text,
                                                    "agentNumber":
                                                        agentTabNumbersControllers
                                                            .text,
                                                    "agentEmail":
                                                        agentTabEmailControllers
                                                            .text,
                                                    'address':
                                                        agentTabAddresslControllers
                                                            .text
                                                  });
                                                  showSnakBar(
                                                      "Agents are updated",
                                                      context);
                                                  Navigator.pop(context);
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Palette.green),
                                                child: const Text("Update"),
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
                                  decoration:
                                      BoxDecoration(color: Color(0xffDBDBDB)),
                                  child: SvgPicture.asset("assets/pencil.svg"),
                                ),
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
