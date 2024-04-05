import 'package:flutter/material.dart';
import 'package:gold_team_investor_go/gold_team/constants/navigators.dart';

class LeadingIcon extends StatelessWidget {
  const LeadingIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navPop(context),
      child: Container(
        height: 40,
        width: 40,
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Image.asset("assets/icons/back.png", fit: BoxFit.cover),
      ),
    );
  }
}
