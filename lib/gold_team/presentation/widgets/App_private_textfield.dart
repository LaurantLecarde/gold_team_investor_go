import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextField extends StatelessWidget {
  const AppTextField(
      {super.key,
      required this.hintText,
      required this.leadingIcon,
      required this.controller});

  final String hintText;
  final Widget leadingIcon;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: Colors.black,
      cursorHeight: 23,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText,
        hintStyle:
            GoogleFonts.nunitoSans(fontWeight: FontWeight.bold, fontSize: 15),
        prefixIcon: leadingIcon,
      ),
    );
  }
}
