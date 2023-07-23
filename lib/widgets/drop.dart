import 'package:flutter/material.dart';
import 'package:fyfe/utils/dropdownutils.dart';
import 'package:fyfe/widgets/alertwidgets.dart';

agents(BuildContext context) {
  DropdownButtonFormField<String>(
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
  );
}
