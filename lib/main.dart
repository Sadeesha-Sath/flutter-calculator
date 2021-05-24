import 'package:flutter/material.dart';
import 'package:flutter_calculator/logic/screen_handler.dart';
import 'package:flutter_calculator/constants.dart';
import 'package:flutter_calculator/ui/before_redesign/calculator_view_1.dart';
import 'package:flutter_calculator/ui/redesign/calculator_view.dart';
import 'package:flutter_calculator/ui/redesign/theme_changer.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Project 1",
      home: HomePage2(),
    );
  }
}

class HomePage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ScreenHandler>(create: (_) => ScreenHandler()),
        ChangeNotifierProvider<ThemeChanger>(create: (_) => ThemeChanger(MediaQuery.of(context).platformBrightness)),
      ],
      builder: (context, child) => Scaffold(
        appBar: themeChangeContainer(context),
        backgroundColor: context.watch<ThemeChanger>().kUniversalScaffoldBackgroundColor,
        body: CalculatorView(),
      ),
    );
  }
}

PreferredSizeWidget themeChangeContainer(BuildContext context) {
  return AppBar(
    shadowColor: Colors.transparent,
    backgroundColor: Colors.transparent,
    title: Container(
      width: 100,
      height: 45,
      child: Material(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 1.5,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              splashRadius: 30,
              onPressed: () {
                context.read<ThemeChanger>().changeTheme(true);
              },
              icon: Icon(
                Icons.wb_sunny_outlined,
                color: context.watch<ThemeChanger>().themeChangerColorResolver(true),
              ),
            ),
            IconButton(
              splashRadius: 30,
              onPressed: () {
                context.read<ThemeChanger>().changeTheme(false);
              },
              icon: Icon(
                Icons.mode_night_outlined,
                color: context.watch<ThemeChanger>().themeChangerColorResolver(false),
              ),
            )
          ],
        ),
        color: context.watch<ThemeChanger>().kUniversalBottomSheetBackground,
      ),
    ),
    centerTitle: true,
  );
}

// ? Before Redesign

class HomePage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Calculator"),
        backgroundColor: Colors.lightBlueAccent.shade700,
      ),
      backgroundColor: kBackgroundColor1,
      body: CalculatorView1(),
    );
  }
}
