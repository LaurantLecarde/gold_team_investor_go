import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee/marquee.dart';

class CircleText extends StatelessWidget {
  const CircleText(
      {super.key,
      required this.text,
      required this.width,
      required this.fontWeight,
      required this.color});

  final String text;
  final double width;
  final FontWeight fontWeight;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: width,
      child: Center(
        child: Marquee(
          text: text,
          style: GoogleFonts.nunitoSans(fontSize: 15,fontWeight:fontWeight,color:color),
          scrollAxis: Axis.horizontal,
          crossAxisAlignment: CrossAxisAlignment.start,
          blankSpace: 20.0,
          velocity: 50.0,
          pauseAfterRound: Duration(seconds: 1),
          startPadding: 10.0,
          accelerationDuration: Duration(seconds: 1),
          accelerationCurve: Curves.linear,
          decelerationDuration: Duration(milliseconds: 500),
          decelerationCurve: Curves.easeOut,
        ),
      ),
    );
  }
}
