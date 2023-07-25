import 'package:flutter/material.dart';
import 'package:fyfe/screens/contacts/tabs/agent_tab.dart';
import 'package:fyfe/screens/contacts/tabs/insure_tab.dart';
import 'package:fyfe/utils/controllers.dart';
import 'package:fyfe/widgets/palette.dart';

class Contacts extends StatefulWidget {
  const Contacts({super.key});

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
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
          "All Contacts",
          style: const TextStyle(
              color: Colors.white,
              fontFamily: "Nunito",
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          initialIndex: 0,
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
            padding: const EdgeInsets.fromLTRB(21.0, 21.0, 21.0, 21.0),
            child: Column(children: [
              TabBar(
                indicatorColor: Colors.transparent,
                isScrollable: true,
                controller: tabController,
                // padding: EdgeInsets.zero,
                // indicatorPadding: EdgeInsets.zero,
                labelPadding: EdgeInsets.only(right: 5),
                tabs: [
                  Container(
                    width: (MediaQuery.of(context).size.width - 42) / 3,
                    decoration: BoxDecoration(
                      color: tabController?.index == 0
                          ? Colors.white
                          : Colors.white.withOpacity(0.45),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Tab(
                      child: Text(
                        "Agents",
                        style: TextStyle(
                          color: tabController?.index == 0
                              ? Palette.blue
                              : Palette.blue.withOpacity(0.45),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: (MediaQuery.of(context).size.width - 42) / 3,
                    decoration: BoxDecoration(
                      color: tabController?.index == 1
                          ? Colors.white
                          : Colors.white.withOpacity(0.45),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Tab(
                      child: Text(
                        "Insurer",
                        style: TextStyle(
                          color: tabController?.index == 1
                              ? Palette.blue
                              : Palette.blue.withOpacity(0.45),
                        ),
                      ),
                    ),
                  ),
                ]..addAll(typesList.sublist(2).map(
                      (type) => Container(
                        width: (MediaQuery.of(context).size.width - 42) / 3,
                        decoration: BoxDecoration(
                          color: tabController?.index ==
                                  (typesList.indexOf(type) + 1)
                              ? Colors.white
                              : Colors.white.withOpacity(0.45),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Tab(
                          child: Text(
                            type,
                            style: TextStyle(
                              color: tabController?.index ==
                                      (typesList.indexOf(type) + 1)
                                  ? Palette.blue
                                  : Palette.blue.withOpacity(0.45),
                            ),
                          ),
                        ),
                      ),
                    )),
              ),
              Expanded(
                  child: TabBarView(
                      controller: tabController,
                      children: [AgentTab(), InsureTab()]))
            ]),
          ),
        ),
      ),
    );
  }
}
