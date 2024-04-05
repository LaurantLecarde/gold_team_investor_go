import "package:flutter/material.dart";

mainTheme(context) {
  final mainTheme = Theme.of(context).primaryColor;
  return mainTheme;
}

myGradientC() {
  final myGradient = const LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [Color(0xff8ca8fa), Color(0xffb38cd4)]);
  return myGradient;
}
