import 'package:flutter/material.dart';
import 'package:flutter_calculator/ui/before_redesign/buttons_1.dart';
import 'package:provider/provider.dart';
import 'package:flutter_calculator/logic/screen_handler.dart';

class CalculatorView1 extends StatefulWidget {
  @override
  CalculatorView1State createState() => CalculatorView1State();
}

class CalculatorView1State extends State<CalculatorView1> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ScreenHandler>(
      create: (_) => ScreenHandler(),
      builder: (context, child) => SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TopContainer1(),
              Buttons1(),
            ],
          ),
        ),
      ),
    );
  }
}

List<Widget> viewHistory1(List<String> stringList) {
  List<Widget> returnList = [];
  if (stringList.length <= 3) {
    for (String history in stringList) {
      returnList.add(
        Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          child: Text(
            history,
            textAlign: TextAlign.right,
            style: TextStyle(color: Colors.grey.shade600, fontSize: 27),
          ),
        ),
      );
    }
  } else {
    for (String history in stringList.sublist(stringList.length - 3)) {
      returnList.add(
        Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          child: Text(
            history,
            textAlign: TextAlign.right,
            style: TextStyle(color: Colors.grey.shade600, fontSize: 27),
          ),
        ),
      );
    }
  }
  if (returnList.length <= 3) return returnList;
  return returnList.sublist(0, 3);
}

class TopContainer1 extends StatelessWidget {
  const TopContainer1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      width: double.infinity,
      color: Colors.lightBlueAccent.shade100.withOpacity(0.3),
      height: MediaQuery.of(context).size.height / 3.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ...viewHistory1(context.watch<ScreenHandler>().showHistory),
          Text(
            context.watch<ScreenHandler>().showValue,
            textAlign: TextAlign.right,
            style: TextStyle(color: Colors.black, fontSize: 45),
          )
        ],
      ),
    );
  }
}
