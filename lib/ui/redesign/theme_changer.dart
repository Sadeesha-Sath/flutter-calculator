import 'package:flutter/material.dart';
import 'package:flutter_calculator/constants.dart';

class ThemeChanger with ChangeNotifier {
  bool _isLightTheme = true;

  ThemeChanger([Brightness? brightness]) {
    if (brightness != null) {
      if (brightness == Brightness.light) {
        _isLightTheme = true;
      } else {
        _isLightTheme = false;
      }
    }
    _isLightTheme = true;
  }

  void changeTheme(bool value) {
    _isLightTheme = value;
    notifyListeners();
  }

  Color get kUniversalScaffoldBackgroundColor {
    if (_isLightTheme) return kScaffoldBackgroundLight;
    return kScaffoldBackgroundDark;
  }

  Color get kUniversalBottomSheetBackground {
    if (_isLightTheme) return kBottomSheetBackgroundLight;
    return kBottomSheetBackgroundDark;
  }

  Color get kUniversalButtonBackground {
    if (_isLightTheme) return kButtonBackgroundLight;
    return kButtonBackgroundDark;
  }

  Color get kUniversalButtonForegroundPrimary {
    if (_isLightTheme) return kButtonForegroundLightPrimary;
    return kButtonForegroundDarkPrimary;
  }

  Color get kUniversalButtonForegroundRed {
    if (_isLightTheme) return kButtonForegroundLightRed;
    return kButtonForegroundDarkRed;
  }

  Color get kUniversalButtonForegroundGreen {
    if (_isLightTheme) return kButtonForegroundLightGreen;
    return kButtonForegroundDarkGreen;
  }

  Color get kUniversalHistory {
    if (_isLightTheme) return kHistoryLight;
    return kHistoryDark;
  }

  TextStyle get kUniversalButtonTextStylePrimary {
    if (_isLightTheme) return kButtonTextStyleLightPrimary;
    return kButtonTextStyleDarkPrimary;
  }

  TextStyle get kUniversalButtonTextStyleRed {
    if (_isLightTheme) return kButtonTextStyleLightRed;
    return kButtonTextStyleDarkRed;
  }

  TextStyle get kUniversalButtonTextStyleGreen {
    if (_isLightTheme) return kButtonTextStyleLightGreen;
    return kButtonTextStyleDarkGreen;
  }

  TextStyle get kUniversalHistoryTextStyle {
    if (_isLightTheme) return kHistoryTextStyleLight;
    return kHistoryTextStyleDark;
  }

  Color themeChangerColorResolver(bool isLight) {
    if (isLight) {
      if (_isLightTheme) return kThemeChangeForegroundLightSelected;
      return kThemeChangeForegroundDarkUnselected;
    }
    if (_isLightTheme) return kThemeChangeForegroundLightUnselected;
    return kThemeChangeForegroundDarkSelected;
  }

  bool get isLightMode => _isLightTheme;
}
