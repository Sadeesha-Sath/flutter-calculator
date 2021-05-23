import 'package:flutter/material.dart';
import 'package:flutter_calculator/constants.dart';
import 'dart:math' as math;

class CalculatorButton1 extends StatelessWidget {
  final int? flex;
  final text;
  final IconData? icon;
  final Color? color;
  final onPressed;
  final bool? transform;

  CalculatorButton1({this.flex, this.transform, this.text, this.color, required this.onPressed, this.icon});

  @override
  Widget build(BuildContext context) {
    // double buttonSize = MediaQuery.of(context).size.width / 5;

    return Expanded(
      flex: flex ?? 1,
      child: Container(
        decoration: BoxDecoration(color: color, border: Border.all(width: 0.4, color: Color(0x33000000))),
        width: double.maxFinite,
        height: double.maxFinite,
        child: TextButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            backgroundColor: MaterialStateProperty.all(color ?? kBackgroundColor1),
          ),
          onPressed: onPressed,
          child: icon != null
              ? transform != null
                  ? Transform.rotate(
                      angle: math.pi / 2,
                      child: Icon(
                        icon,
                        color: color != null ? Colors.white : Colors.black,
                      ),
                    )
                  : Icon(
                      icon,
                      color: color != null ? Colors.white : Colors.black,
                    )
              : Text(
                  text?.toString() ?? "1",
                  style: TextStyle(color: color != null ? Colors.white : Colors.black, fontSize: 22),
                ),
        ),
      ),
    );
  }
}
