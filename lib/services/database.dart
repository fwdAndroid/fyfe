import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fyfe/models/agent_model.dart';
import 'package:fyfe/models/insurace_model.dart';
import 'package:uuid/uuid.dart';

class Database {
  Future<String> addAgent(
      {required String agentEmail,
      required String companyName,
      required String phoneNumber,
      required String contactName,
      required String address}) async {
    String res = 'Some error occured';
    var ss = Uuid().v4();
    try {
      //Add User to the database with modal
      AgentModel userModel = AgentModel(
          uuid: ss,
          agentEmail: agentEmail,
          address: address,
          agentNumber: phoneNumber,
          id: FirebaseAuth.instance.currentUser!.uid,
          contactName: contactName,
          companyName: companyName);
      await FirebaseFirestore.instance
          .collection('agents')
          .doc(ss)
          .set(userModel.toJson());
      res = 'success';
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  //Insurance
  Future<String> addInsure({
    required String contactEmail,
    required String contactNumber,
    required String contactName,
  }) async {
    String res = 'Some error occured';
    var ss = Uuid().v4();
    try {
      //Add User to the database with modal
      InsuranceModel userModel = InsuranceModel(
        uuid: ss,
        contactEmail: contactEmail,
        contactNumber: contactNumber,
        id: FirebaseAuth.instance.currentUser!.uid,
        contactName: contactName,
      );
      await FirebaseFirestore.instance
          .collection('insurance')
          .doc(ss)
          .set(userModel.toJson());
      res = 'success';
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
