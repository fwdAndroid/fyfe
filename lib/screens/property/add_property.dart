import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyfe/screens/property/add_property_image.dart';
import 'package:fyfe/utils/text_util.dart';
import 'package:fyfe/utils/textformfield.dart';
import 'package:fyfe/utils/thousands_formatter.dart';
import 'package:fyfe/widgets/custom_appbar.dart';
import 'package:fyfe/widgets/custom_drawer.dart';
import 'package:fyfe/widgets/palette.dart';
import 'package:fyfe/widgets/step_indicator.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AddProperty extends StatefulWidget {
  const AddProperty({super.key});

  @override
  State<AddProperty> createState() => _AddPropertyState();
}

class _AddPropertyState extends State<AddProperty> {
  var scaffoldkey = new GlobalKey<ScaffoldState>();
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();

  bool loading = false;
  bool addAgentLoading = false;
  bool agentsLoading = false;
  bool insurersLoading = false;
  TextEditingController propertyAddressController = TextEditingController();
  TextEditingController carparksController = TextEditingController();
  TextEditingController bedsController = TextEditingController();
  TextEditingController bathroomsController = TextEditingController();
  TextEditingController purchasepriceController = TextEditingController();
  TextEditingController valueController = TextEditingController();
  TextEditingController loanController = TextEditingController();
  TextEditingController rentController = TextEditingController();
  TextEditingController datePurchaseController = TextEditingController();
  TextEditingController leaseStartDateController = TextEditingController();
  TextEditingController leaseStartDateend = TextEditingController();
  TextEditingController policyNumberController = TextEditingController();
  TextEditingController policyStartController = TextEditingController();
  TextEditingController policyEndController = TextEditingController();
  TextEditingController contactNameController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      drawer: CustomDrawer(
        user: FirebaseAuth.instance.currentUser!.displayName,
        userImage: FirebaseAuth.instance.currentUser!.photoURL,
        signOut: GoogleSignIn().signOut,
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
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomAppbar(
                      title: "Add Property",
                      trailing: SizedBox(
                        width: 30,
                      ),
                      ontapLeading: () {
                        scaffoldkey.currentState?.openDrawer();
                      },
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Center(child: StepIndicator(selected: 1)),
                    const SizedBox(
                      height: 18,
                    ),
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
                      controller: propertyAddressController,
                      hintText: "15 Roma Rd St Ives",
                      textInputType: TextInputType.emailAddress,
                      validat: (value) {
                        if (value!.isEmpty) {
                          "This field is required";
                        }
                        return null;
                      },
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
                    // Drop Down Builder
                    // GetBuilder<AddPropertyController>(builder: (_) {
                    //   return Container(
                    //     // margin:
                    //     //     const EdgeInsets.fromLTRB(10, 0, 10, 20),
                    //     padding: const EdgeInsets.symmetric(
                    //       horizontal: 20,
                    //       vertical: 7,
                    //     ),
                    //     decoration: BoxDecoration(
                    //       color: Colors.white,
                    //       borderRadius: BorderRadius.circular(10),
                    //     ),
                    //     child: DropdownButtonFormField<String>(
                    //       isExpanded: true,
                    //       alignment: AlignmentDirectional.center,
                    //       hint: const Text(
                    //         'Name',
                    //         // style: TextStyle(
                    //         //     color: Colors.grey[400],
                    //         //     fontSize: 14),
                    //       ),
                    //       items: controller.propertyTypes.map((e) {
                    //         return DropdownMenuItem<String>(
                    //           alignment: AlignmentDirectional.center,
                    //           value: e,
                    //           child: Text(
                    //             e,
                    //             style: const TextStyle(
                    //                 color:
                    //                     // controller.military == 1
                    //                     //     ? ColorsApp
                    //                     //         .backgroundColorMamoli
                    //                     // :
                    //                     Colors.black),
                    //           ),
                    //         );
                    //       }).toList(),
                    //       icon: const SizedBox(),
                    //       onTap: () {
                    //         log("looopo");
                    //       },
                    //       value: controller.propertyType,
                    //       onChanged: (value) {
                    //         controller.propertyType = value!;
                    //       },
                    //       decoration: const InputDecoration(
                    //         isDense: true,
                    //         border: InputBorder.none,
                    //       ),
                    //       validator: (value) {
                    //         // log("value is " + value.toString());
                    //         // return Validator.validateDropDown(value);
                    //       },
                    //       // controller.leaveType==0?null:controller.leaveType,
                    //       // borderRadius: BorderRadius.circular(10),
                    //     ),
                    //   );
                    // }),
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
                                validat: (value) {
                                  if (value!.isEmpty) {
                                    "This field is required";
                                  }
                                  return null;
                                },
                                inputFormatters: [ThousandsInputFormatter()],
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
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
                                validat: (value) {
                                  if (value!.isEmpty) {
                                    "This field is required";
                                  }
                                  return null;
                                },
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
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
                                validat: (value) {
                                  if (value!.isEmpty) {
                                    "This field is required";
                                  }
                                  return null;
                                },
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
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
                                validat: (value) {
                                  if (value!.isEmpty) {
                                    "Purchase date is required";
                                  }
                                  return null;
                                },
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
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
                                    // Expanded(
                                    //   flex: 14,
                                    //   child:
                                    //       DropdownButtonHideUnderline(
                                    //           child:
                                    //               DropdownButtonFormField<
                                    //                   String>(
                                    //     items: controller.rentTypes
                                    //         .map((e) =>
                                    //             DropdownMenuItem<
                                    //                 String>(
                                    //               value: e,
                                    //               child: Text(e),
                                    //             ))
                                    //         .toList(),
                                    //     value: controller.rentType,
                                    //     decoration: InputDecoration(
                                    //       border: InputBorder.none,
                                    //       isDense: true,
                                    //     ),
                                    //     onChanged: (value) => controller
                                    //         .setRentType(value),
                                    //   )),
                                    // )
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
                                  hint: agentsLoading
                                      ? Center(
                                          child: Image.asset(
                                            "assets/loading.gif",
                                            color: Colors.black,
                                          ),
                                        )
                                      : const Text(
                                          'Name',
                                        ),
                                  items: <String>["Fawad "]
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
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
                                            addAgentDialog(context, "Agents");
                                          },
                                          child: Row(
                                            children: const [
                                              Icon(Icons.add),
                                              Text(
                                                'Add Agent',
                                                style: TextStyle(
                                                    color:
                                                        // controller.military == 3
                                                        //     ? ColorsApp
                                                        //         .backgroundColorMamoli
                                                        //     :
                                                        Colors.black),
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
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
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
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
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
                                  hint: agentsLoading
                                      ? Center(
                                          child: Image.asset(
                                            "assets/loading.gif",
                                            color: Colors.black,
                                          ),
                                        )
                                      : const Text(
                                          'Name',
                                        ),
                                  items: <String>["Fawad "]
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
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
                                            addAgentDialog(context, "Agents");
                                          },
                                          child: Row(
                                            children: const [
                                              Icon(Icons.add),
                                              Text(
                                                'Add Insurer',
                                                style: TextStyle(
                                                    color:
                                                        // controller.military == 3
                                                        //     ? ColorsApp
                                                        //         .backgroundColorMamoli
                                                        //     :
                                                        Colors.black),
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
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
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
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
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
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
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
                      child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) => AddPropertyImage()));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Palette.aqua,
                            padding: const EdgeInsets.symmetric(vertical: 17),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: const Text(
                          "Save",
                          style: TextStyle(
                              fontFamily: "Mulish",
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void addAgentDialog(BuildContext context, String dataType) {
    // controller.emptyAddAgentFields();
    final formKey = GlobalKey<FormState>();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(
            child: TextUtil(
              title: "Add ${dataType == "agents" ? "Agent" : "Insurer"}",
            ),
          ),
          content: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextUtil(
                    title: "* Contact Name",
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormInputField(
                    validat: (value) {
                      if (value!.isEmpty) {
                        "This field is required";
                      }
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: contactNameController,
                    hintText: "Contact Name",
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
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: companyNameController,
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
                    controller: numberController,
                    hintText: "Number",
                    textInputType: TextInputType.number,
                    validat: (value) {
                      if (value!.isEmpty) {
                        "This field is required";
                      }
                      return null;
                    },
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
                    controller: emailController,
                    hintText: "Email Address",
                    textInputType: TextInputType.emailAddress,
                    validat: (value) {
                      if (value!.isEmpty) {
                        "This field is required";
                      }
                      return null;
                    },
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
                    controller: addressController,
                    hintText: "Address",
                    textInputType: TextInputType.emailAddress,
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            addAgentLoading
                ? SizedBox(
                    height: 38,
                    width: 38,
                    child: Image.asset(
                      "assets/loading.gif",
                      color: Colors.black,
                    ),
                  )
                : Row(
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
                            //  controller.addAgentOrInsurer(dataType);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Palette.green),
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
