import 'package:flutter/services.dart';
Color regularBlack = "#000000".toColor();
Color regularWhite = "#FFFFFF".toColor();
Color bgColor = "#FFFFFF".toColor();
Color buttonColor = regularBlack;
Color lightPurple = "#7D76E5".toColor();
Color lightGray = "##707070".toColor();
Color borderColor = "##F4F4F4".toColor();
Color grayContainer = "##F5F5F5".toColor();




extension ColorExtension on String {
  toColor() {
    var hexColor = replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}

setStatusBarColor(Color color) {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: color,
  ));
}
