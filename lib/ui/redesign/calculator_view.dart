import 'package:flutter/material.dart';
import 'package:flutter_calculator/logic/screen_handler.dart';
import 'package:flutter_calculator/ui/redesign/buttons.dart';
import 'package:flutter_calculator/ui/redesign/theme_changer.dart';
import 'package:provider/provider.dart';

class CalculatorView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      child: Column(
        children: [
          TopContainer(),
          Buttons(),
        ],
      ),
    );
  }
}

class TopContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 10,
      child: Container(
        alignment: Alignment.bottomRight,
        padding: EdgeInsets.only(left: 27, right: 27, bottom: 20),
        width: double.infinity,
        height: double.infinity,
        child: ListView(
          shrinkWrap: true,
          children: [
            ...viewHistory1(context.watch<ScreenHandler>().showHistory, context),
            Text(
              context.watch<ScreenHandler>().showValue,
              textAlign: TextAlign.right,
              style: TextStyle(
                  color: context.watch<ThemeChanger>().kUniversalButtonForegroundPrimary,
                  fontSize: 50,
                  fontWeight: FontWeight.w700,
                  fontFamily: "SF Pro Text"),
            )
          ],
        ),
      ),
    );
  }
}

List<Widget> viewHistory1(List<String> stringList, BuildContext context) {
  List<Widget> returnList = [];
  if (stringList.length <= 3) {
    for (String history in stringList) {
      returnList.add(
        Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          child: Text(
            history,
            textAlign: TextAlign.right,
            style: context.watch<ThemeChanger>().kUniversalHistoryTextStyle,
          ),
        ),
      );
    }
    return returnList;
  }
  for (String history in stringList.sublist(stringList.length - 3)) {
    returnList.add(
      Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        child: Text(
          history,
          textAlign: TextAlign.right,
          style: context.watch<ThemeChanger>().kUniversalHistoryTextStyle,
        ),
      ),
    );
  }
  return returnList;
}
