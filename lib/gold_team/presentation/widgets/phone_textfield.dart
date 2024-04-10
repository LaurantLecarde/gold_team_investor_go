import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PhoneTextField extends StatelessWidget {
  const PhoneTextField(
      {super.key,
        required this.hint,
        required this.leading,
        required this.controller,
        required this.number,
        required this.section, required this.maskInputFormatters});

  final String hint;
  final Widget leading;
  final TextEditingController controller;
  final bool number;
  final MaskTextInputFormatter maskInputFormatters;
  final String section;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: SizedBox(
        width: double.infinity,
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(color: Colors.black26)),
          elevation: 3,
          color: Colors.lightBlue.shade50,
          shadowColor: Colors.black,
          surfaceTintColor: Colors.lightBlue.shade50,
          clipBehavior: Clip.hardEdge,
          child: TextFormField(
            inputFormatters: [maskInputFormatters],
            keyboardType: number ? TextInputType.number : TextInputType.text,
            cursorColor: Colors.black,
            controller: controller,
            decoration: InputDecoration(
                prefixIcon: leading,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.black26, width: 3)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(12)),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.red, width: 3)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.red, width: 1)),
                hintText: hint,
                hintStyle: GoogleFonts.nunitoSans(),
                errorStyle: GoogleFonts.nunitoSans()),
            validator: (value) {
              if (value!.isEmpty) {
                return "Iltimos $section Qismini To'ldiring";
              }
              return null;
            },
          ),
        ),
      ),
    );
  }
}
