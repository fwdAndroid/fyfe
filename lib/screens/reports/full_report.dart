import 'package:flutter/material.dart';
import 'package:fyfe/utils/text_util.dart';

class FullReport extends StatefulWidget {
  final agentName;
  final insure;
  final loanAmount;
  final numberofbathrooms;
  final numberofbeds;
  final numberofcarparks;
  final policyEndDate;
  final policyNumber;
  final policyObtainedDate;
  final propertyAddress;
  final propertyLeaseEnd;
  final propertyLeaseStart;
  final propertyPurchaseDate;
  final propertyPurchasePrice;
  final propertyRent;
  final propertyType;
  final propertyValue;
  final uuid;

  const FullReport(
      {super.key,
      required this.agentName,
      required this.insure,
      required this.loanAmount,
      required this.numberofbathrooms,
      required this.numberofbeds,
      required this.numberofcarparks,
      required this.policyEndDate,
      required this.policyNumber,
      required this.policyObtainedDate,
      required this.propertyAddress,
      required this.propertyLeaseEnd,
      required this.propertyLeaseStart,
      required this.propertyPurchaseDate,
      required this.propertyPurchasePrice,
      required this.propertyRent,
      required this.propertyType,
      required this.propertyValue,
      required this.uuid});

  @override
  State<FullReport> createState() => _FullReportState();
}

class _FullReportState extends State<FullReport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Propery Report",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Type of Property",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.propertyType,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 0.5,
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Agent Name",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.agentName,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Issure",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.insure,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 0.5,
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Rent",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.propertyRent.toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Property Value",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.propertyValue,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Loan",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.loanAmount.toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 0.5,
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Number of Beds",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.numberofbeds,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Number of Bethrooms",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.numberofbathrooms,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Number of Carparks",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.numberofcarparks.toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 0.5,
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Property Price",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.propertyPurchasePrice.toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Property Purchase Date",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.propertyPurchaseDate,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 0.5,
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Policy Number",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.policyNumber.toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Policy Obtained Date",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.policyObtainedDate,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
