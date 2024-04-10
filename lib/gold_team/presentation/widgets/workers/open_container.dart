import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:google_fonts/google_fonts.dart';

class OpenContainerToggling extends StatelessWidget {
  const OpenContainerToggling(
      {super.key, required this.text, required this.to});

  final String text;
  final Widget to;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedColor: Colors.transparent,
      transitionDuration: const Duration(seconds: 2),
      closedElevation: 0,
      openColor: Colors.transparent,
      openElevation: 0,
      closedBuilder: (context, action) {
        return Text(text,
            style: GoogleFonts.nunitoSans(
                color: Colors.indigoAccent, fontWeight: FontWeight.bold));
      },
      openBuilder: (context, action) {
        return to;
      },
    );
  }
}
