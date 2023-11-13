import 'package:flutter/material.dart';

class MyThemeData {
  static const Color primaryLightColor=Color(0xff5D9CEC);
  static const Color whiteColor=Color(0xffFFFFFF);
  static const Color greenColor=Color(0xff61E757);
  static const Color redColor=Color(0xffEC4B4B);
  static const Color blackColor=Color(0xff383838);
  static const Color backgroundLightColor=Color(0xffDFECDB);
  static ThemeData lightMode=ThemeData(
    primaryColor: primaryLightColor,
    appBarTheme: AppBarTheme(
      backgroundColor: primaryLightColor,
      elevation: 0,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      selectedItemColor: primaryLightColor,
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.transparent,
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        color: whiteColor,
        fontWeight: FontWeight.bold,
        fontSize: 30
      ),
      headline2: TextStyle(
          color: blackColor,
          fontWeight: FontWeight.bold,
          fontSize: 25
      ),
      subtitle1: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w400,
          fontSize: 23
      ),
      subtitle2:TextStyle(
          color: whiteColor,
          fontWeight: FontWeight.bold,
          fontSize: 25
      ),
    )

  );
}