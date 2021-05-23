import 'package:flutter/material.dart';
import 'package:flutter_calculator/constants.dart';

class ScreenHandler with ChangeNotifier {
  List<String> operators = ["+", "-", kMultiplicationSymbol, kDivideSymbol, "%"];
  List<String> _history = [];
  String _activeValue = "";
  bool isPositive = true;

  void addNumber(int number) {
    _activeValue += number.toString();
    notifyListeners();
  }

  void addOperators(String operator) {
    if (_activeValue == "" || !operators.contains(_activeValue.split(" ").join().characters.last)) {
      if (_activeValue != "")
        _activeValue += " $operator ";
      else
        _activeValue += "$operator ";
    }
    notifyListeners();
  }

  void changeSign() {
    if (isPositive) {
      _activeValue = "- $_activeValue";
      isPositive = false;
    } else {
      _activeValue = _activeValue.substring(2);
      isPositive = true;
    }
    notifyListeners();
  }

  void deleteChar() {
    if (_activeValue.isNotEmpty) {
      if (_activeValue.endsWith(" "))
        _activeValue = _activeValue.substring(0, _activeValue.length - 2);
      else
        _activeValue = _activeValue.substring(0, _activeValue.length - 1);

      notifyListeners();
    }
  }

  void addDecimal() {
    if (_activeValue.isNotEmpty) {
      if (!operators.contains(_activeValue.split(" ").join().characters.last) &&
          !_activeValue.split(" ").last.contains(".")) {
        _activeValue += ".";
      }
    }
    notifyListeners();
  }

  void clearValue() {
    if (_activeValue == "") {
      _history = [];
      isPositive = true;
    } else {
      _activeValue = "";
      isPositive = true;
    }
    notifyListeners();
  }

  void updateValue(double value) {
    List<String> newValueList = value.toString().split(".");
    if (newValueList.length != 1 && newValueList[1] == 0.toString()) {
      _activeValue = newValueList[0];
    } else {
      _activeValue = value.toStringAsFixed(5);
    }

    notifyListeners();
  }

  String get showValue {
    return _activeValue;
  }

  List<String> get showHistory {
    return _history;
  }

  double calculate([String? expression]) {
    if (expression == null) {
      if (_history.isEmpty || _history[_history.length - 1] != _activeValue) _history.add(_activeValue);
      _activeValue = _activeValue.split(" ").join();
    }
    if ((_activeValue.contains("%") && expression == null) || (expression != null && expression.contains("%"))) {
      List<String> percentageList = expression?.split("%") ?? _activeValue.split("%");
      double expression1Value = calculate(percentageList.first) * 100;
      if (percentageList.sublist(1).join() != "") {
        double expression2Value = calculate(percentageList.sublist(1).join());
        updateValue(expression1Value * expression2Value);
        return expression1Value * expression2Value;
      } else {
        updateValue(expression1Value);
        return expression1Value;
      }
    } else if ((_activeValue.contains("+") && expression == null) || (expression != null && expression.contains("+"))) {
      List<String> additionList = expression?.split("+") ?? _activeValue.split("+");
      double expression1Value = calculate(additionList.first);
      double expression2Value = calculate(additionList.sublist(1).join());
      updateValue(expression1Value + expression2Value);
      return expression1Value + expression2Value;
    } else if ((_activeValue.contains("-") && expression == null) || (expression != null && expression.contains("-"))) {
      List<String> subtractionList = expression?.split("-") ?? _activeValue.split("-");
      double expression1Value = calculate(subtractionList.first);
      double expression2Value = calculate(subtractionList.sublist(1).join());
      updateValue(expression1Value - expression2Value);
      return expression1Value - expression2Value;
    } else if ((_activeValue.contains(kMultiplicationSymbol) && expression == null) ||
        (expression != null && expression.contains(kMultiplicationSymbol))) {
      List<String> multiplicationList =
          expression?.split(kMultiplicationSymbol) ?? _activeValue.split(kMultiplicationSymbol);
      double expression1Value = calculate(multiplicationList.first);
      double expression2Value = calculate(multiplicationList.sublist(1).join());
      updateValue(expression1Value * expression2Value);
      return expression1Value * expression2Value;
    } else if ((_activeValue.contains(kDivideSymbol) && expression == null) ||
        (expression != null && expression.contains(kDivideSymbol))) {
      List<String> divisionList = expression?.split(kDivideSymbol) ?? _activeValue.split(kDivideSymbol);
      double expression1Value = calculate(divisionList.first);
      double expression2Value = calculate(divisionList.sublist(1).join());
      updateValue(expression1Value / expression2Value);
      return expression1Value / expression2Value;
    } else {
      notifyListeners();
      return double.tryParse(expression ?? _activeValue) ?? 0;
    }
  }
}
