import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyfe/models/property_model.dart';
import 'package:fyfe/utils/controllers.dart';
import 'package:fyfe/utils/dropdownutils.dart';
import 'package:fyfe/utils/showsnak.dart';
import 'package:fyfe/utils/text_util.dart';
import 'package:fyfe/utils/textformfield.dart';
import 'package:fyfe/utils/thousands_formatter.dart';
import 'package:fyfe/widgets/alertwidgets.dart';
import 'package:fyfe/widgets/save_button_widget.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import '../screens/property/add_property_image.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({super.key});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 9),
              child: TextUtil(
                title: "* Property Address",
              ),
            ),
            const SizedBox(
              height: 9,
            ),
            TextFormInputField(
              // onTap: () {
              //   Navigator.pushNamed(context, "/addressPage");
              // },
              controller: propertyAddressController,
              hintText: "15 Roma Rd St Ives",
              textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 9),
              child: TextUtil(
                title: "Property Types",
              ),
            ),
            const SizedBox(
              height: 9,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 7,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: DropdownButtonFormField<String>(
                isExpanded: true,
                alignment: AlignmentDirectional.center,
                hint: const Text(
                  'Name',
                ),
                items: propertyTypes.map((e) {
                  return DropdownMenuItem<String>(
                    alignment: AlignmentDirectional.center,
                    value: e,
                    child: Text(
                      e,
                      style: const TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
                icon: const SizedBox(),
                value: propertyType,
                onChanged: (value) {
                  propertyType = value!;
                },
                decoration: const InputDecoration(
                  isDense: true,
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 9),
                        child: TextUtil(
                          title: "Beds",
                        ),
                      ),
                      const SizedBox(
                        height: 9,
                      ),
                      TextFormInputField(
                        controller: bedsController,
                        hintText: "0",
                        textInputType: TextInputType.number,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 9),
                        child: TextUtil(
                          title: "Bathrooms",
                        ),
                      ),
                      const SizedBox(
                        height: 9,
                      ),
                      TextFormInputField(
                        controller: bathroomsController,
                        hintText: "0",
                        textInputType: TextInputType.number,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 9),
                        child: TextUtil(
                          title: "Car Parks",
                        ),
                      ),
                      const SizedBox(
                        height: 11,
                      ),
                      TextFormInputField(
                        controller: carparksController,
                        hintText: "0",
                        textInputType: TextInputType.number,
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 9),
                        child: TextUtil(
                          title: "* Value",
                        ),
                      ),
                      const SizedBox(
                        height: 9,
                      ),
                      TextFormInputField(
                        inputFormatters: [ThousandsInputFormatter()],
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: valueController,
                        hintText: "0",
                        textInputType: TextInputType.number,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 9),
                        child: TextUtil(
                          title: "* Purchase price",
                        ),
                      ),
                      const SizedBox(
                        height: 9,
                      ),
                      TextFormInputField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: purchasepriceController,
                        hintText: "0",
                        textInputType: TextInputType.number,
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 9),
                        child: TextUtil(
                          title: "* Loan",
                        ),
                      ),
                      const SizedBox(
                        height: 9,
                      ),
                      TextFormInputField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: loanController,
                        hintText: "0",
                        textInputType: TextInputType.number,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 9),
                        child: TextUtil(
                          title: "* Purchase Date",
                        ),
                      ),
                      const SizedBox(
                        height: 9,
                      ),
                      TextFormInputField(
                        onTap: () {
                          setDate(context, datePurchaseController);
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: datePurchaseController,
                        hintText: "12/12/2022",
                        textInputType: TextInputType.datetime,
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 9),
                        child: TextUtil(
                          title: "Rent",
                        ),
                      ),
                      const SizedBox(
                        height: 9,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 7, horizontal: 12),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 8,
                                child: TextFormInputField(
                                  controller: rentController,
                                  hintText: "0",
                                  textInputType: TextInputType.number,
                                )),
                            const SizedBox(
                              width: 3,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 9),
                        child: TextUtil(
                          title: "Agent",
                        ),
                      ),
                      const SizedBox(
                        height: 9,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 7,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButtonFormField<String>(
                          isExpanded: true,
                          alignment: AlignmentDirectional.center,
                          hint: const Text(
                            'Name',
                          ),
                          items: [''].map((e) {
                            return DropdownMenuItem<String>(
                              alignment: AlignmentDirectional.center,
                              value: agentName,
                              child: Text(
                                "",
                                style: const TextStyle(color: Colors.black),
                              ),
                            );
                          }).toList()
                            ..add(DropdownMenuItem<String>(
                              enabled: false,
                              value: "0",
                              alignment: AlignmentDirectional.center,
                              child: InkWell(
                                onTap: () {
                                  Dialogs().addAgentDialog(context, "Agents");
                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.add),
                                    Text(
                                      agentName,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                          icon: const SizedBox(),
                          value: agentName,
                          onChanged: (value) {
                            agentName = value!;
                          },
                          decoration: const InputDecoration(
                            isDense: true,
                            border: InputBorder.none,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 9),
                        child: TextUtil(
                          title: "Lease Start",
                        ),
                      ),
                      const SizedBox(
                        height: 9,
                      ),
                      TextFormInputField(
                        onTap: () {
                          setDate(context, leaseStartDateController);
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: leaseStartDateController,
                        hintText: "12/12/2022",
                        textInputType: TextInputType.datetime,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 9),
                        child: TextUtil(
                          title: "Lease end",
                        ),
                      ),
                      const SizedBox(
                        height: 9,
                      ),
                      TextFormInputField(
                        onTap: () {
                          setDate(context, leaseStartDateend);
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: leaseStartDateend,
                        hintText: "12/12/2022",
                        textInputType: TextInputType.datetime,
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 9),
                        child: TextUtil(
                          title: "Insurer",
                        ),
                      ),
                      const SizedBox(
                        height: 9,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 7,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButtonFormField<String>(
                          isExpanded: true,
                          alignment: AlignmentDirectional.center,
                          //  value: dropdownValue,
                          onChanged: (String? newValue) {
                            setState(() {
                              //   dropdownValue = newValue!;
                            });
                          },
                          hint: const Text(
                            'Name',
                          ),
                          items: <String>[""]
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(fontSize: 20),
                              ),
                            );
                          }).toList()
                            ..add(
                              DropdownMenuItem<String>(
                                child: InkWell(
                                  onTap: () {
                                    Dialogs().addInsuranceDialog(
                                        context, "Insurance");
                                  },
                                  child: Row(
                                    children: const [
                                      Icon(Icons.add),
                                      Text(
                                        'Add Insurer',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 9),
                        child: TextUtil(
                          title: "Policy number",
                        ),
                      ),
                      const SizedBox(
                        height: 9,
                      ),
                      TextFormInputField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: policyNumberController,
                        hintText: "123455",
                        textInputType: TextInputType.number,
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 9),
                        child: TextUtil(
                          title: "Policy Start",
                        ),
                      ),
                      const SizedBox(
                        height: 9,
                      ),
                      TextFormInputField(
                        onTap: () {
                          setDate(context, policyStartController);
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: policyStartController,
                        hintText: "12/12/2022",
                        textInputType: TextInputType.datetime,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 9),
                        child: TextUtil(
                          title: "Policy End",
                        ),
                      ),
                      const SizedBox(
                        height: 9,
                      ),
                      TextFormInputField(
                        onTap: () {
                          setDate(context, policyEndController);
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: policyEndController,
                        hintText: "12/12/2022",
                        textInputType: TextInputType.datetime,
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: SaveButton(
                  title: "Save",
                  onTap: () async {
                    if (propertyAddressController.text.isEmpty) {
                      showSnakBar("Address is Required", context);
                    } else if (valueController.text.isEmpty) {
                      showSnakBar("Property Value is Required", context);
                    } else if (purchasepriceController.text.isEmpty) {
                      showSnakBar("Property Price is Required", context);
                    } else if (loanController.text.isEmpty) {
                      showSnakBar("Loan Amount is Required", context);
                    } else if (datePurchaseController.text.isEmpty) {
                      showSnakBar("Date is Required", context);
                    } else if (propertyAddressController.text.isEmpty &&
                        valueController.text.isEmpty &&
                        purchasepriceController.text.isEmpty) {
                      showSnakBar("All Fields is Required", context);
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => AddPropertyImage()));
                    }
                  },
                )),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  setDate(context, TextEditingController controller) {
    showDatePicker(
      context: context,
      initialDate: controller.text.isNotEmpty
          ? DateFormat('dd/MM/yyyy').parse(controller.text)
          : DateTime.now(),
      firstDate: DateTime(1950, 01, 01),
      lastDate: DateTime(2100, 01, 01),
    ).then((value) {
      if (value != null) {
        controller.text = DateFormat('dd/MM/yyyy').format(value);
      }
    });
  }
}
