import 'package:flutter/material.dart';
import 'package:fyfe/widgets/palette.dart';

class StepIndicator extends StatelessWidget {
  final int selected;
  StepIndicator({Key? key, required this.selected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.071,
      width: MediaQuery.of(context).size.width * 0.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Container(
                  // margin:EdgeInsets.only(right:  Get.locale.languageCode=="fa"?10:0),

                  padding: EdgeInsets.only(top: 2),
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.036,
                  width: MediaQuery.of(context).size.height * 0.036,
                  decoration: BoxDecoration(
                    color: Palette.blue,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    "1",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * 0.037),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 5,
                    color: selected >= 2 ? Palette.blue : Colors.white,
                  ),
                ),
                Container(
                  // margin: EdgeInsets.only(
                  //     left: Get.locale.languageCode == "fa" ? 10 : 0),
                  padding: EdgeInsets.only(top: 2),
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.036,
                  width: MediaQuery.of(context).size.height * 0.036,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: selected >= 2 ? Palette.blue : Colors.white,
                  ),
                  child: Text(
                    "2",
                    style: TextStyle(
                        color: selected >= 2 ? Colors.white : Colors.black,
                        fontSize: MediaQuery.of(context).size.width * 0.037),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 1,
                child: Text(
                  "form",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.032,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Flexible(
                flex: 1,
                child: Text(
                  "images",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.032,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
