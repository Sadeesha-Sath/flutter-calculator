import 'package:flutter/material.dart';

// Colors

const Color kBackgroundColor1 = Colors.white;

// Strings

const String kDivideSymbol = "÷";
const String kMultiplicationSymbol = "×";

// ? New Redesign

// Dark Mode

const Color kScaffoldBackgroundDark = Color(0xFF1D242D);
const Color kBottomSheetBackgroundDark = Color(0xFF272A32);
const Color kButtonBackgroundDark = Color(0xFF24282F);
const Color kButtonForegroundDarkPrimary = Color(0xFFF0F0F0);
const Color kButtonForegroundDarkRed = Color(0xFFC85B5D);
const Color kButtonForegroundDarkGreen = Color(0xFF26EBC8);
const Color kThemeChangeForegroundDarkUnselected = Color(0xFF686A70);
const Color kThemeChangeForegroundDarkSelected = Color(0xFFD7D8D9);
const Color kHistoryDark = Color(0xFFBDBDBD);

// Light Mode

const Color kScaffoldBackgroundLight = Color(0xFFFFFFFF);
const Color kBottomSheetBackgroundLight = Color(0xFFF7F7F7);
const Color kButtonBackgroundLight = Color(0xFFF4F4F4);
const Color kButtonForegroundLightRed = Color(0xFFEC7171);
const Color kButtonForegroundLightPrimary = Color(0xFF353841);
const Color kButtonForegroundLightGreen = Color(0xFF3AC6AD);
const Color kThemeChangeForegroundLightUnselected = Color(0xFFE3E3E3);
const Color kThemeChangeForegroundLightSelected = Color(0xFF4A4E55);
const Color kHistoryLight = Color(0xFF535868);

// ButtonTextStyles

// Light Mode

const TextStyle kButtonTextStyleLightPrimary = TextStyle(
    color: kButtonForegroundLightPrimary, fontSize: 25, fontWeight: FontWeight.bold, fontFamily: "SF Pro Text");
const TextStyle kButtonTextStyleLightGreen =
    TextStyle(color: kButtonForegroundLightGreen, fontSize: 25, fontWeight: FontWeight.bold, fontFamily: "SF Pro Text");
const TextStyle kButtonTextStyleLightRed =
    TextStyle(color: kButtonForegroundLightRed, fontSize: 25, fontWeight: FontWeight.bold, fontFamily: "SF Pro Text");

const TextStyle kHistoryTextStyleLight =
    TextStyle(color: kHistoryLight, fontSize: 25, fontWeight: FontWeight.w600, fontFamily: "SF Pro Text");

// Dark Mode

const TextStyle kButtonTextStyleDarkPrimary = TextStyle(
    color: kButtonForegroundDarkPrimary, fontSize: 25, fontWeight: FontWeight.bold, fontFamily: "SF Pro Text");
const TextStyle kButtonTextStyleDarkGreen =
    TextStyle(color: kButtonForegroundDarkGreen, fontSize: 25, fontWeight: FontWeight.bold, fontFamily: "SF Pro Text");
const TextStyle kButtonTextStyleDarkRed =
    TextStyle(color: kButtonForegroundDarkRed, fontSize: 25, fontWeight: FontWeight.bold, fontFamily: "SF Pro Text");

const TextStyle kHistoryTextStyleDark =
    TextStyle(color: kHistoryDark, fontSize: 25, fontWeight: FontWeight.w600, fontFamily: "SF Pro Text");
