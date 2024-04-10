import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

final titleStyle =
    GoogleFonts.nunitoSans(fontWeight: FontWeight.bold, fontSize: 19);
final subTitleStyle = GoogleFonts.nunitoSans(fontSize: 15);
final titleStyleSub =
    GoogleFonts.nunitoSans(fontSize: 15, fontWeight: FontWeight.bold);

final titleStyleBot = GoogleFonts.nunitoSans(
    fontWeight: FontWeight.bold, fontSize: 19, color: Colors.white);

final myDecoration = BoxDecoration(boxShadow: [
  BoxShadow(color: Colors.black26, spreadRadius: 5, blurRadius: 5)
], color: Colors.white, borderRadius: BorderRadius.circular(15));
