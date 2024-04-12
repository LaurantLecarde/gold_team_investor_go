import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class PasswordTextFieldWidget extends StatelessWidget {
  const PasswordTextFieldWidget(
      {super.key,
      required this.hint,
      required this.controller,
      required this.leading,
      required this.prefIcon,
      required this.close,
      required this.number,
      required this.section});

  final String hint;
  final TextEditingController controller;
  final Widget leading;
  final Widget prefIcon;
  final bool close;
  final bool number;
  final String section;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: SizedBox(
        width: double.infinity,
        child: Center(
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
              keyboardType: number ? TextInputType.number : TextInputType.text,
              obscureText: close,
              cursorColor: Colors.black,
              controller: controller,
              decoration: InputDecoration(
                  prefixIcon: leading,
                  suffixIcon: prefIcon,
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

              },
            ),
          ),
        ),
      ),
    );
  }
}
