import 'package:cloud_firestore/cloud_firestore.dart';

class InsuranceModel {
  String id;
  String contactName;
  String? uuid;
  String contactNumber;
  String contactEmail;

  InsuranceModel(
      {required this.contactEmail,
      this.uuid,
      required this.contactNumber,
      required this.id,
      required this.contactName});

  Map<String, dynamic> toJson() => {
        'id': id,
        'contactName': contactName,
        "uuid": uuid,
        "contactNumber": contactNumber,
        "contactEmail": contactEmail,
      };
  static InsuranceModel fromSnap(DocumentSnapshot snaps) {
    var snapshot = snaps.data() as Map<String, dynamic>;

    return InsuranceModel(
      id: snapshot['id'],
      contactName: snapshot['contactName'],
      uuid: snapshot['uuid'],
      contactNumber: snapshot['contactNumber'],
      contactEmail: snapshot['contactEmail'],
    );
  }
}
