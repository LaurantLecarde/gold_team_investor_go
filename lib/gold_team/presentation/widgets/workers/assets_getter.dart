import "package:flutter/material.dart";

assetsIcn(String icon,Color color){
  String newIcon = "assets/icons/${icon}.png";
  var newIcn = Image.asset(newIcon,fit:BoxFit.cover,color: color);
  return newIcn;
}
assetsImg(String image,Color color){
  String newIcon = "assets/icons/${image}.png";
  var newIcn = Image.asset(newIcon,fit:BoxFit.cover,color: color);
  return newIcn;
}
assetsLg(String logo,Color color){
  String newIcon = "assets/icons/${logo}.png";
  var newIcn = Image.asset(newIcon,fit:BoxFit.cover,color: color);
  return newIcn;
}
assetsAnim(String anim,Color color){
  String newIcon = "assets/icons/${anim}.png";
  var newIcn = Image.asset(newIcon,fit:BoxFit.cover,color: color);
  return newIcn;
}