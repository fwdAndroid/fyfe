import 'package:flutter/material.dart';
import 'package:fyfe/utils/controllers.dart';
import 'package:fyfe/utils/dropdownutils.dart';
import 'package:fyfe/utils/text_util.dart';
import 'package:fyfe/utils/textformfield.dart';
import 'package:fyfe/widgets/save_button_widget.dart';

class AddAccount extends StatefulWidget {
  const AddAccount({super.key});

  @override
  State<AddAccount> createState() => _AddAccountState();
}

class _AddAccountState extends State<AddAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: const Color(
          0xff3AC1CD,
        ),
        elevation: 0,
        title: const Text(
          "Add Account",
          style: const TextStyle(
              color: Colors.white,
              fontFamily: "Nunito",
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: Container(
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 9),
                child: TextUtil(
                  title: "Account Types",
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
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButtonFormField<String>(
                  isExpanded: true,
                  alignment: AlignmentDirectional.center,
                  hint: const Text(
                    'Name',
                  ),
                  items: accountTypes.map((e) {
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
                  value: accountType,
                  onChanged: (value) {
                    accountType = value!;
                  },
                  decoration: const InputDecoration(
                    isDense: true,
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 9),
                child: TextUtil(
                  title: "User Email",
                ),
              ),
              const SizedBox(
                height: 9,
              ),
              TextFormInputField(
                controller: emailController,
                hintText: "abc@gmail.com",
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 9),
                child: TextUtil(
                  title: "User Address",
                ),
              ),
              const SizedBox(
                height: 9,
              ),
              TextFormInputField(
                controller: addressController,
                hintText: "14 E Eden Garden",
                textInputType: TextInputType.text,
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 9),
                child: TextUtil(
                  title: "User Phone Number",
                ),
              ),
              const SizedBox(
                height: 9,
              ),
              TextFormInputField(
                controller: numberController,
                hintText: "1246363",
                textInputType: TextInputType.phone,
              ),
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: SaveButton(title: "Save", onTap: () {}))
            ],
          ),
        ),
      ),
    );
  }
}
