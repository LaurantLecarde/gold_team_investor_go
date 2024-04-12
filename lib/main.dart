import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:gold_team_investor_go/gold_team/exe_directory/exe.dart';

import 'gold_team/presentation/screens/auth_page/sign_in_screens/sign_in.dart';

void main() {
  runApp(GoldenInvest());
}

class GoldenInvest extends StatelessWidget {
  const GoldenInvest({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true, primaryColor: Color(0xffe6e9ef)),
      debugShowCheckedModeBanner: false,
      // home: LoginRegisterFlip(),
      home: AnimatedSplashScreen(
        duration: 1250,
        backgroundColor: Colors.black,
        splash: SizedBox(
            height: 80,
            width: 120,
            child: Image.asset("assets/logo/gold_team.png", fit: BoxFit.cover)),
        nextScreen: LoginRegisterFlip(),
        splashTransition: SplashTransition.fadeTransition,
      ),
    );
  }
}
