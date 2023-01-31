import "package:calender/Utils/Colors/Colors.dart";
import "package:flutter/material.dart";

ThemeData customLightTheme() {
  final ThemeData lightTheme = ThemeData.light();
  return lightTheme.copyWith(
      brightness: Brightness.light,
      backgroundColor: ColorClass().blue50,
      primaryColor: ColorClass().blue50,
      scaffoldBackgroundColor: ColorClass().blue50,
      accentColor: ColorClass().black,
      buttonColor: ColorClass().blue700,
      iconTheme: IconThemeData(color: ColorClass().blue900),
      tabBarTheme: TabBarTheme(unselectedLabelColor: ColorClass().blue300),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(ColorClass().blue700))),
      buttonTheme: ButtonThemeData(buttonColor: ColorClass().blue700),
      appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(color: Colors.black),
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: ColorClass().blue50),
      textTheme: TextTheme(
          bodyText1: TextStyle(color: ColorClass().black),
          bodyText2: TextStyle(color: ColorClass().black),
          headline1: TextStyle(color: ColorClass().black),
          headline2: TextStyle(color: ColorClass().black),
          caption: TextStyle(color: ColorClass().black),
          subtitle1: TextStyle(color: ColorClass().black),
          subtitle2: TextStyle(color: ColorClass().black),
          overline: TextStyle(color: ColorClass().black)));
}

ThemeData customDarkTheme() {
  final ThemeData darkTheme = ThemeData.dark();
  return darkTheme.copyWith(
      brightness: Brightness.dark,
      backgroundColor: ColorClass().black,
      primaryColor: ColorClass().black,
      buttonColor: ColorClass().teal700,
      accentColor: ColorClass().white,
      tabBarTheme: TabBarTheme(unselectedLabelColor: ColorClass().teal300),
      iconTheme: IconThemeData(color: ColorClass().teal900),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(ColorClass().teal700))),
      buttonTheme: ButtonThemeData(buttonColor: ColorClass().teal700),
      appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: ColorClass().white),
          titleTextStyle: TextStyle(color: ColorClass().white),
          backgroundColor: ColorClass().teal700,
          textTheme: TextTheme(
              bodyText1: TextStyle(color: ColorClass().white),
              bodyText2: TextStyle(color: ColorClass().white),
              headline1: TextStyle(color: ColorClass().white),
              headline2: TextStyle(color: ColorClass().white),
              caption: TextStyle(color: ColorClass().white),
              subtitle1: TextStyle(color: ColorClass().white),
              subtitle2: TextStyle(color: ColorClass().white),
              overline: TextStyle(color: ColorClass().white))));
}
