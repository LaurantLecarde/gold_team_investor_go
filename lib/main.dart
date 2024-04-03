import 'package:animated_splash_screen/animated_splash_screen.dart';
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
      theme: ThemeData(useMaterial3: true, primaryColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        duration: 1250,
        backgroundColor: Colors.black,
        splash: SizedBox(
            height: 80,
            width: 120,
            child: Image.asset("assets/logo/gold_team.png", fit: BoxFit.cover)),
        nextScreen: const SignIn(),
        splashTransition: SplashTransition.fadeTransition,
      ),
    );
  }
}
