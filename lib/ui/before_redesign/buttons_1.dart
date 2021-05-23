import 'package:flutter/material.dart';
import 'package:flutter_calculator/logic/screen_handler.dart';
import 'package:flutter_calculator/constants.dart';
import 'package:flutter_calculator/ui/before_redesign/calculator_button_1.dart';
import 'package:provider/provider.dart';

class Buttons1 extends StatelessWidget {
  const Buttons1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          FirstColumn1(),
          SecondColumn1(),
          ThirdColumn1(),
          FourthColumn1(),
        ],
      ),
    );
  }
}

class FirstColumn1 extends StatelessWidget {
  const FirstColumn1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CalculatorButton1(
            text: context.watch<ScreenHandler>().showValue == "" ? "C" : "CE",
            color: Colors.redAccent.withOpacity(0.8),
            onPressed: () => context.read<ScreenHandler>().clearValue(),
          ),
          CalculatorButton1(
            text: 7,
            onPressed: () => context.read<ScreenHandler>().addNumber(7),
          ),
          CalculatorButton1(
            text: 4,
            onPressed: () => context.read<ScreenHandler>().addNumber(4),
          ),
          CalculatorButton1(
            text: 1,
            onPressed: () => context.read<ScreenHandler>().addNumber(1),
          ),
          CalculatorButton1(
            // icon: Icons.,
            text: "±",
            onPressed: () => context.read<ScreenHandler>().changeSign(),
          )
        ],
      ),
    );
  }
}

class SecondColumn1 extends StatelessWidget {
  const SecondColumn1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CalculatorButton1(
            // icon: Icons.,
            text: "%",
            onPressed: () => context.read<ScreenHandler>().addOperators("%"),
          ),
          CalculatorButton1(
            text: 8,
            onPressed: () => context.read<ScreenHandler>().addNumber(8),
          ),
          CalculatorButton1(
            text: 5,
            onPressed: () => context.read<ScreenHandler>().addNumber(5),
          ),
          CalculatorButton1(
            text: 2,
            onPressed: () => context.read<ScreenHandler>().addNumber(2),
          ),
          CalculatorButton1(
            text: 0,
            onPressed: () => context.read<ScreenHandler>().addNumber(0),
          )
        ],
      ),
    );
  }
}

class ThirdColumn1 extends StatelessWidget {
  const ThirdColumn1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CalculatorButton1(
            // icon: Icons.,
            text: kDivideSymbol,
            onPressed: () => context.read<ScreenHandler>().addOperators(kDivideSymbol),
          ),
          CalculatorButton1(
            text: 9,
            onPressed: () => context.read<ScreenHandler>().addNumber(9),
          ),
          CalculatorButton1(
            text: 6,
            onPressed: () => context.read<ScreenHandler>().addNumber(6),
          ),
          CalculatorButton1(
            text: 3,
            onPressed: () => context.read<ScreenHandler>().addNumber(3),
          ),
          CalculatorButton1(
            text: ".",
            onPressed: () => context.read<ScreenHandler>().addDecimal(),
          ),
        ],
      ),
    );
  }
}

class FourthColumn1 extends StatelessWidget {
  const FourthColumn1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CalculatorButton1(
            onPressed: () => context.read<ScreenHandler>().deleteChar(),
            color: Colors.redAccent.withOpacity(0.8),
            icon: Icons.backspace_outlined,
          ),
          CalculatorButton1(
            // text: "-",
            icon: Icons.remove_rounded,
            onPressed: () => context.read<ScreenHandler>().addOperators("-"),
          ),
          CalculatorButton1(
            icon: Icons.clear_rounded,
            onPressed: () => context.read<ScreenHandler>().addOperators(kMultiplicationSymbol),
          ),
          CalculatorButton1(
            icon: Icons.add,
            onPressed: () => context.read<ScreenHandler>().addOperators("+"),
          ),
          CalculatorButton1(
            color: Colors.green.withOpacity(0.75),
            icon: Icons.pause_rounded,
            transform: true,
            onPressed: () => context.read<ScreenHandler>().calculate(),
            // text: "=",
          )
        ],
      ),
    );
  }
}
