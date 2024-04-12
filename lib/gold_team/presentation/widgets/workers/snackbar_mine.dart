import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

showMineSnackBar(String text, Color color,context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        text,
        style: GoogleFonts.nunitoSans(
            color: Colors.white, fontWeight: FontWeight.bold),
      ),
      backgroundColor: color));
}