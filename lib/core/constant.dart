import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ConstantColor{
  static Color primaryColor=const Color(0XFFa26e53);

  //static Color primaryColor= HexColor("#A16E53");
  static Color secondaryColor=const Color(0XFF17173C);
  static Color greyColor=const Color(0XFF707070);
  static Color greyWColor=const Color(0XFFe2e2e2);

  static Color whiteColor= Colors.white;
}

class SizedConstant{
  static double defaultSize=10.0;
  static double radiusAuthSize=40.0;

}

class ImageConstant{
   static const  String pathImage='assets/images';
   static String logoImage='$pathImage/logo.png';
   static String splashImage='$pathImage/splash.png';
}
