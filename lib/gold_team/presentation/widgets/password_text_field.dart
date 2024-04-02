import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.leadingIcon,
      required this.prefixIcon,
      required this.close});

  final String hintText;
  final TextEditingController controller;
  final Widget leadingIcon;
  final Widget prefixIcon;
  final bool close;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: close,
      cursorColor: Colors.black,
      cursorHeight: 23,
      controller: controller,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText,
        hintStyle:
            GoogleFonts.nunitoSans(fontWeight: FontWeight.bold, fontSize: 15),
        prefixIcon: leadingIcon,
        suffixIcon: prefixIcon,
      ),
    );
  }
}
