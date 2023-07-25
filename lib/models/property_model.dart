import 'package:cloud_firestore/cloud_firestore.dart';

class PropertyModel {
  String id;
  List<String>? photo = [];
  String propertyAddress;
  String? propertyType;
  String? uuid;
  String? beds;
  String? bathrooms;
  String? carParks;
  int value;
  int purchasePrice;
  int loan;
  String purchaseDate;
  int rent;
  String? agent;
  String? leaseStart;
  String? leaseEnd;
  String? insurer;
  String? policyNumber;
  String? policyStart;
  String? policyEnd;

  PropertyModel(
      {this.agent,
      this.bathrooms,
      this.carParks,
      this.insurer,
      this.leaseEnd,
      this.leaseStart,
      this.policyEnd,
      this.uuid,
      this.policyNumber,
      this.policyStart,
      this.photo,
      this.beds,
      this.propertyType,
      required this.id,
      required this.value,
      required this.loan,
      required this.rent,
      required this.purchaseDate,
      required this.purchasePrice,
      required this.propertyAddress});

  Map<String, dynamic> toJson() => {
        'id': id,
        "photo": photo,
        'propertyAddress': propertyAddress,
        "propertyType": propertyType,
        "uuid": uuid,
        "beds": beds,
        "bathrooms": bathrooms,
        "carParks": carParks,
        "value": value,
        "purchasePrice": purchasePrice,
        "loan": loan,
        "purchaseDate": purchaseDate,
        "rent": rent,
        "agent": agent,
        "leaseStart": leaseStart,
        "leaseEnd": leaseEnd,
        "insurer": insurer,
        "policyNumber": policyNumber,
        "policyStart": policyStart,
        "policyEnd": policyEnd
      };
  static PropertyModel fromSnap(DocumentSnapshot snaps) {
    var snapshot = snaps.data() as Map<String, dynamic>;

    return PropertyModel(
        id: snapshot['id'],
        photo: snapshot['photo'],
        propertyAddress: snapshot['propertyAddress'],
        propertyType: snapshot['propertyType'],
        uuid: snapshot['uuid'],
        beds: snapshot['beds'],
        bathrooms: snapshot['bathrooms'],
        carParks: snapshot['carParks'],
        value: snapshot['value'],
        purchasePrice: snapshot['purchasePrice'],
        loan: snapshot['loan'],
        purchaseDate: snapshot['purchaseDate'],
        rent: snapshot["rent"],
        agent: snapshot['agent'],
        leaseStart: snapshot["leaseStart"],
        leaseEnd: snapshot['leaseEnd'],
        insurer: snapshot['insurer'],
        policyNumber: snapshot['policyNumber'],
        policyEnd: snapshot['policyEnd'],
        policyStart: snapshot["policyStart"]);
  }
}
