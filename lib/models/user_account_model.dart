import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id;
  String accountEmail;
  String accountPhone;
  String? uuid;
  String type;
  String accountAddress;

  UserModel(
      {this.uuid,
      required this.accountAddress,
      required this.accountPhone,
      required this.id,
      required this.type,
      required this.accountEmail});

  Map<String, dynamic> toJson() => {
        'id': id,
        'accountEmail': accountEmail,
        "accountPhone": accountPhone,
        "uuid": uuid,
        "accountAddress": accountAddress,
        "type": type
      };
  static UserModel fromSnap(DocumentSnapshot snaps) {
    var snapshot = snaps.data() as Map<String, dynamic>;

    return UserModel(
      id: snapshot['id'],
      accountEmail: snapshot['accountEmail'],
      accountPhone: snapshot['accountPhone'],
      uuid: snapshot['uuid'],
      type: snapshot['type'],
      accountAddress: snapshot['accountAddress'],
    );
  }
}
