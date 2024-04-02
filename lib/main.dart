import 'package:flutter/material.dart';
import 'package:gold_team_investor_go/gold_team/presentation/screens/sign_in_screens/sign_in.dart';

void main() {
  runApp(const GoldenInvest());
}

class GoldenInvest extends StatelessWidget {
  const GoldenInvest({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:  ThemeData(
        useMaterial3: true,
        primaryColor: Colors.white
      ),
      debugShowCheckedModeBanner: false,
      home:const SignIn(),
    );
  }
}

