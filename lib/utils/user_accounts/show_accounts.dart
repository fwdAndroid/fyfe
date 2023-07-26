import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fyfe/utils/user_accounts/add_account.dart';

class ShowAccounts extends StatefulWidget {
  const ShowAccounts({super.key});

  @override
  State<ShowAccounts> createState() => _ShowAccountsState();
}

class _ShowAccountsState extends State<ShowAccounts> {
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
          "User Account",
          style: const TextStyle(
              color: Colors.white,
              fontFamily: "Nunito",
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (builder) => AddAccount()));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: SvgPicture.asset(
                "assets/addProperty.svg",
              ),
            ),
          ),
        ],
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
      ),
    );
  }
}
