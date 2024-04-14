import "package:flutter/material.dart";

assetsIcn(String icon,Color color){
  String newIcon = "assets/icons/${icon}.png";
  var newIcn = Image.asset(newIcon,fit:BoxFit.cover,color: color);
  return newIcn;
}
assetsImg(String image){
  String newIcon = "assets/images/${image}.png";
  var newIcn = Image.asset(newIcon,fit:BoxFit.cover);
  return newIcn;
}
assetsLg(String logo){
  String newIcon = "assets/logo/${logo}.png";
  var newIcn = Image.asset(newIcon,fit:BoxFit.cover);
  return newIcn;
}
assetsAnim(String anim){
  String newIcon = "assets/lottie/${anim}.json";
  var newIcn = Image.asset(newIcon,fit:BoxFit.cover);
  return newIcn;
}