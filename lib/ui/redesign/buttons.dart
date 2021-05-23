import 'package:flutter/material.dart';
import 'package:flutter_calculator/constants.dart';
import 'package:flutter_calculator/ui/redesign/theme_changer.dart';
import 'package:provider/provider.dart';
import 'package:flutter_calculator/logic/screen_handler.dart';

class Buttons extends StatefulWidget {
  @override
  _ButtonsState createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  late ScreenHandler _screenHandlerWatch;
  late ScreenHandler _screenHandlerRead;
  late ThemeChanger _themeChanger;

  @override
  Widget build(BuildContext context) {
    _themeChanger = context.watch<ThemeChanger>();
    _screenHandlerRead = context.read<ScreenHandler>();
    _screenHandlerWatch = context.watch<ScreenHandler>();
    return Expanded(
      flex: 19,
      child: Material(
        elevation: 3,
        color: _themeChanger.kUniversalBottomSheetBackground,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 15,
              crossAxisSpacing: 20,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              return Material(
                elevation: 0.25,
                borderRadius: BorderRadius.circular(30),
                color: _themeChanger.kUniversalButtonBackground,
                child: InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: buttonList.elementAt(index)['onPressed'] as void Function(),
                  child: Center(
                    child: buttonList.elementAt(index)['child'] as Widget,
                  ),
                ),
              );
            },
            itemCount: 20,
          ),
        ),
      ),
    );
  }

  void addNumber(int number) {
    _screenHandlerRead.addNumber(number);
  }

  void addOperators(String operator1) {
    _screenHandlerRead.addOperators(operator1);
  }

  void clearValue() {
    _screenHandlerRead.clearValue();
  }

  void deleteChar() {
    _screenHandlerRead.deleteChar();
  }

  void changeSign() {
    _screenHandlerRead.changeSign();
  }

  String showValue() {
    return _screenHandlerWatch.showValue;
  }

  void addDecimal() {
    _screenHandlerRead.addDecimal();
  }

  void calculate() {
    _screenHandlerRead.calculate();
  }

  List<Map<String, dynamic>> get buttonList => [
        // ? ROW 1
        {
          'child': Text(showValue() == "" ? "AC" : "CE", style: _themeChanger.kUniversalButtonTextStyleGreen),
          'onPressed': () => clearValue(),
        },
        {
          'child': Text("%", style: _themeChanger.kUniversalButtonTextStyleGreen),
          'onPressed': () => addOperators("%"),
        },
        {
          'child': Text(kDivideSymbol, style: _themeChanger.kUniversalButtonTextStyleRed.copyWith(fontSize: 30)),
          'onPressed': () => addOperators(kDivideSymbol),
        },
        {
          // 'child': Icon(Icons.keyboard_backspace_outlined, color: kButtonForegroundLightGreen),
          'child': Text("DEL", style: _themeChanger.kUniversalButtonTextStyleGreen.copyWith(fontSize: 24)),
          'onPressed': () => deleteChar(),
        },
        // ? ROW 2
        {
          'child': Text("7", style: _themeChanger.kUniversalButtonTextStylePrimary),
          'onPressed': () => addNumber(7),
        },

        {
          'child': Text("8", style: _themeChanger.kUniversalButtonTextStylePrimary),
          'onPressed': () => addNumber(8),
        },
        {
          'child': Text("9", style: _themeChanger.kUniversalButtonTextStylePrimary),
          'onPressed': () => addNumber(9),
        },
        {
          // 'child': Icon(Icons.remove_rounded, color: kButtonForegroundLightRed),
          'child': Text("-", style: _themeChanger.kUniversalButtonTextStyleRed.copyWith(fontSize: 33)),
          'onPressed': () => addOperators("-"),
        },
        // ? ROW 3
        {
          'child': Text("4", style: _themeChanger.kUniversalButtonTextStylePrimary),
          'onPressed': () => addNumber(4),
        },
        {
          'child': Text("5", style: _themeChanger.kUniversalButtonTextStylePrimary),
          'onPressed': () => addNumber(5),
        },

        {
          'child': Text("6", style: _themeChanger.kUniversalButtonTextStylePrimary),
          'onPressed': () => addNumber(6),
        },
        {
          // 'child': Icon(Icons.clear_rounded, color: kButtonForegroundLightRed),
          'child': Text(kMultiplicationSymbol, style: _themeChanger.kUniversalButtonTextStyleRed.copyWith(fontSize: 30)),
          'onPressed': () => addOperators(kMultiplicationSymbol),
        },
        // ? ROW 4
        {
          'child': Text("1", style: _themeChanger.kUniversalButtonTextStylePrimary),
          'onPressed': () => addNumber(1),
        },
        {
          'child': Text("2", style: _themeChanger.kUniversalButtonTextStylePrimary),
          'onPressed': () => addNumber(2),
        },
        {
          'child': Text("3", style: _themeChanger.kUniversalButtonTextStylePrimary),
          'onPressed': () => addNumber(3),
        },

        {
          // 'child': Icon(Icons.add, color: kButtonForegroundLightRed),
          'child': Text("+", style: _themeChanger.kUniversalButtonTextStyleRed.copyWith(fontSize: 30)),
          'onPressed': () => addOperators("+"),
        },
        // ? ROW 5
        {
          'child': Text("+/-", style: _themeChanger.kUniversalButtonTextStyleGreen),
          'onPressed': () => changeSign(),
        },
        {
          'child': Text("0", style: _themeChanger.kUniversalButtonTextStylePrimary),
          'onPressed': () => addNumber(0),
        },
        {
          'child': Text(".", style: _themeChanger.kUniversalButtonTextStylePrimary.copyWith(fontSize: 30)),
          'onPressed': () => addDecimal(),
        },
        {
          // 'child': Icon(Icons.pause_rounded, color: kButtonForegroundLightRed),
          'child': Text("=", style: _themeChanger.kUniversalButtonTextStyleRed.copyWith(fontSize: 30)),
          'onPressed': () => calculate(),
        },
      ];
}
