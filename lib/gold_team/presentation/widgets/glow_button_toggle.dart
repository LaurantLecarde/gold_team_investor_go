import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:google_fonts/google_fonts.dart';

class LogRegButton extends StatelessWidget {
  const LogRegButton({super.key, required this.text, required this.onTap});

  final void Function()? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GlowButton(
      color: Colors.indigoAccent,
      splashColor: Colors.indigoAccent,
      glowColor: Colors.indigoAccent,
      borderRadius: BorderRadius.circular(12),
      onPressed: onTap,
      child: Text(
        text,
        style: GoogleFonts.nunitoSans(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }
}
