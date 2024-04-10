import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'leading_icon.dart';

class AppBarApp extends StatelessWidget implements PreferredSizeWidget {
  const AppBarApp({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return GradientAppBar(
      title: Text(title,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
      gradient: LinearGradient(
        colors: [
          Color(0xff1d2b62),
          Color(0xff4f315f)
        ], // Your custom gradient colors
        begin: Alignment.centerLeft,
        end: Alignment.bottomRight,
      ),
    );
  }

  final double height = 110;

  Size get preferredSize => Size.fromHeight(height);
}

class GradientAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height = 110;
  final Widget title;
  final LinearGradient gradient;

  GradientAppBar({required this.title, required this.gradient});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      height: height,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [LeadingIcon(), const Gap(40), title]),
      ),
      decoration: BoxDecoration(
        gradient: gradient,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 1),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
