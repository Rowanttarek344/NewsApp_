import 'dart:ui';

import 'package:flutter/material.dart';

class MyTheme{
  static Color primary_color=Color(0xff39A552);
  static Color gray_color=Color(0xff4F5A69);
  static Color white_color=Color(0xffffffff);
  static Color black_color=Color(0xff303030);

  static Color red_color=Color(0xffC91C22);
  static Color navy_color=Color(0xff003E90);
  static Color pink_color=Color(0xffED1E79);
  static Color brown_color=Color(0xffCF7E48);
  static Color blue_color=Color(0xff4882CF);
  static Color yellow_color=Color(0xffF2D352);
  static Color orange_color=Colors.orange;




  static ThemeData light_theme=ThemeData(
    primaryColor: primary_color,
    textTheme: TextTheme(
      headline1: TextStyle(
        color: white_color,
        fontSize: 22,
        fontWeight: FontWeight.bold

      ),
        headline2: TextStyle(
            color: black_color,
            fontSize: 24,
            fontWeight: FontWeight.bold

        ),
        headline3: TextStyle(
            color: gray_color,
            fontSize: 22,
            fontWeight: FontWeight.bold

        ),
        headline4: TextStyle(
            color: white_color,
            fontSize: 20,
            fontWeight: FontWeight.normal

        ),
        headline5: TextStyle(
            color: white_color,
            fontSize: 18,
            fontWeight: FontWeight.w600

        ),
        headline6: TextStyle(
            color: primary_color,
            fontSize: 18,
            fontWeight: FontWeight.w600

        ),
        subtitle1: TextStyle(
            color: gray_color,
            fontSize: 16,
            fontWeight: FontWeight.normal

        ),
        subtitle2: TextStyle(
            color: black_color,
            fontSize: 18,
            fontWeight: FontWeight.w500

        )
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: primary_color
    )



  );
}