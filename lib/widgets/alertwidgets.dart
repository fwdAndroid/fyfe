import 'package:flutter/material.dart';
import 'package:fyfe/services/database.dart';
import 'package:fyfe/utils/controllers.dart';
import 'package:fyfe/utils/text_util.dart';
import 'package:fyfe/utils/textformfield.dart';
import 'package:fyfe/widgets/palette.dart';

class Dialogs {
  void addAgentDialog(BuildContext context, String dataType) {
    final formKey = GlobalKey<FormState>();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(
            child: TextUtil(
              title: 'Add Agent"}',
            ),
          ),
          content: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                    controller: alertwidgetaddagentNameController,
                    validat: (value) {
                      if (value!.isEmpty) {
                        return "This field is required";
                      }
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    textInputType: TextInputType.text,
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
                    controller: alertWidgetaddAgentCompanyController,
                    hintText: "Company Name",
                    textInputType: TextInputType.text,
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
                    controller: alertWidgetaddNumbercontroller,
                    validat: (value) {
                      if (value!.isEmpty) {
                        return "This field is required";
                      }
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    textInputType: TextInputType.number,
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
                    controller: alertWidgetaddAgentEmailController,
                    validat: (value) {
                      if (value!.isEmpty) {
                        return "This field is required";
                      }
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    textInputType: TextInputType.emailAddress,
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
                      controller: addagentalrertaddresscontroller,
                      hintText: "Address",
                      textInputType: TextInputType.text)
                ],
              ),
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
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
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Database()
                          .addAgent(
                              agentEmail:
                                  alertWidgetaddAgentEmailController.text,
                              companyName:
                                  alertWidgetaddAgentCompanyController.text,
                              phoneNumber: alertWidgetaddNumbercontroller.text,
                              contactName:
                                  alertwidgetaddagentNameController.text,
                              address: addagentalrertaddresscontroller.text)
                          .then((value) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Agent Added")));
                        Navigator.pop(context);
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("No Agent Added")));
                    }
                  },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Palette.green),
                  child: const Text("Add"),
                ),
              ],
            )
          ],
        );
      },
    );
  }

  //Insurance
  void addInsuranceDialog(BuildContext context, String dataType) {
    final formKey = GlobalKey<FormState>();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(
            child: TextUtil(
              title: 'Add Insurer"}',
            ),
          ),
          content: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "* Insurance Name",
                    style: TextStyle(fontSize: 12),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormInputField(
                    hintText: "Melanie Smith",
                    controller: alertwidgetinsuranceNameController,
                    validat: (value) {
                      if (value!.isEmpty) {
                        return "This field is required";
                      }
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    textInputType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  const Text(
                    "* Insurance Contact Number",
                    style: TextStyle(fontSize: 12),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormInputField(
                    controller: alertWidgetinsurancePhoneController,
                    validat: (value) {
                      if (value!.isEmpty) {
                        return "This field is required";
                      }
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    textInputType: TextInputType.number,
                    hintText: "Number",
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  const Text(
                    "* Insurance Contact Email",
                    style: TextStyle(fontSize: 12),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormInputField(
                    controller: alertinsuranceEmailController,
                    validat: (value) {
                      if (value!.isEmpty) {
                        return "This field is required";
                      }
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    textInputType: TextInputType.emailAddress,
                    hintText: "Email",
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
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
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Database()
                          .addInsure(
                        contactEmail: alertinsuranceEmailController.text,
                        contactNumber: insurancePhoneController.text,
                        contactName: alertwidgetinsuranceNameController.text,
                      )
                          .then((value) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Insurrance Added")));
                        Navigator.pop(context);
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("No Insurrance Added")));
                    }
                  },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Palette.green),
                  child: const Text("Add"),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
