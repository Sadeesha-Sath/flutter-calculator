import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_calculator/app_logic/screen_handler.dart';
import 'package:flutter_calculator/ui/calculator_button.dart';
import 'package:flutter_calculator/constants.dart';

class CalculatorView extends StatefulWidget {
  @override
  CalculatorViewState createState() => CalculatorViewState();
}

class CalculatorViewState extends State<CalculatorView> {
  List<Widget> viewHistory(List<String> stringList) {
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

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ScreenHandler>(
      create: (_) => ScreenHandler(),
      builder: (context, child) => SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                width: double.infinity,
                color: Colors.lightBlueAccent.shade100.withOpacity(0.3),
                height: MediaQuery.of(context).size.height / 3.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ...viewHistory(context.watch<ScreenHandler>().showHistory),
                    Text(
                      context.watch<ScreenHandler>().showValue,
                      textAlign: TextAlign.right,
                      style: TextStyle(color: Colors.black, fontSize: 45),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CalculatorButton(
                          text: context.watch<ScreenHandler>().showValue == "" ? "C" : "CE",
                          color: Colors.redAccent.withOpacity(0.8),
                          onPressed: () => context.read<ScreenHandler>().clearValue(),
                        ),
                        CalculatorButton(
                          text: 7,
                          onPressed: () => context.read<ScreenHandler>().addNumber(7),
                        ),
                        CalculatorButton(
                          text: 4,
                          onPressed: () => context.read<ScreenHandler>().addNumber(4),
                        ),
                        CalculatorButton(
                          text: 1,
                          onPressed: () => context.read<ScreenHandler>().addNumber(1),
                        ),
                        CalculatorButton(
                          // icon: Icons.,
                          text: "±",
                          onPressed: () => context.read<ScreenHandler>().changeSign(),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CalculatorButton(
                          // icon: Icons.,
                          text: "%",
                          onPressed: () => context.read<ScreenHandler>().addOperators("%"),
                        ),
                        CalculatorButton(
                          text: 8,
                          onPressed: () => context.read<ScreenHandler>().addNumber(8),
                        ),
                        CalculatorButton(
                          text: 5,
                          onPressed: () => context.read<ScreenHandler>().addNumber(5),
                        ),
                        CalculatorButton(
                          text: 2,
                          onPressed: () => context.read<ScreenHandler>().addNumber(2),
                        ),
                        CalculatorButton(
                          text: 0,
                          onPressed: () => context.read<ScreenHandler>().addNumber(0),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CalculatorButton(
                          // icon: Icons.,
                          text: kDivideSymbol,
                          onPressed: () => context.read<ScreenHandler>().addOperators(kDivideSymbol),
                        ),
                        CalculatorButton(
                          text: 9,
                          onPressed: () => context.read<ScreenHandler>().addNumber(9),
                        ),
                        CalculatorButton(
                          text: 6,
                          onPressed: () => context.read<ScreenHandler>().addNumber(6),
                        ),
                        CalculatorButton(
                          text: 3,
                          onPressed: () => context.read<ScreenHandler>().addNumber(3),
                        ),
                        CalculatorButton(
                          text: ".",
                          onPressed: () => context.read<ScreenHandler>().addDecimal(),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CalculatorButton(
                          onPressed: () => context.read<ScreenHandler>().deleteChar(),
                          color: Colors.redAccent.withOpacity(0.8),
                          icon: Icons.backspace_outlined,
                        ),
                        CalculatorButton(
                          // text: "-",
                          icon: Icons.remove_rounded,
                          onPressed: () => context.read<ScreenHandler>().addOperators("-"),
                        ),
                        CalculatorButton(
                          icon: Icons.clear_rounded,
                          onPressed: () => context.read<ScreenHandler>().addOperators(kMultiplicationSymbol),
                        ),
                        CalculatorButton(
                          icon: Icons.add,
                          onPressed: () => context.read<ScreenHandler>().addOperators("+"),
                        ),
                        CalculatorButton(
                          color: Colors.green.withOpacity(0.75),
                          icon: Icons.pause_rounded,
                          transform: true,
                          onPressed: () => context.read<ScreenHandler>().calculate(),
                          // text: "=",
                        )
                      ],
                    ),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
