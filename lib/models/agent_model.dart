import 'package:cloud_firestore/cloud_firestore.dart';

class AgentModel {
  String id;
  String contactName;
  String? companyName;
  String? uuid;
  String agentNumber;
  String agentEmail;
  String? address;

  AgentModel(
      {required this.agentEmail,
      this.address,
      this.uuid,
      required this.agentNumber,
      this.companyName,
      required this.id,
      required this.contactName});

  Map<String, dynamic> toJson() => {
        'id': id,
        'contactName': contactName,
        "companyName": companyName,
        "uuid": uuid,
        "agentNumber": agentNumber,
        "agentEmail": agentEmail,
        "address": address,
      };
  static AgentModel fromSnap(DocumentSnapshot snaps) {
    var snapshot = snaps.data() as Map<String, dynamic>;

    return AgentModel(
      id: snapshot['id'],
      contactName: snapshot['contactName'],
      companyName: snapshot['companyName'],
      uuid: snapshot['uuid'],
      agentNumber: snapshot['agentNumber'],
      agentEmail: snapshot['agentEmail'],
      address: snapshot['address'],
    );
  }
}
