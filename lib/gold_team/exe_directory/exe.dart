import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import '../presentation/screens/auth_page/sign_in_screens/sign_in.dart';
import '../presentation/screens/auth_page/sign_up_screens/sign_up_screen.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login/Register Flip Animation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginRegisterFlip(),
    );
  }
}

class LoginRegisterFlip extends StatefulWidget {
  @override
  _LoginRegisterFlipState createState() => _LoginRegisterFlipState();
}

class _LoginRegisterFlipState extends State<LoginRegisterFlip> {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlipCard(
          key: cardKey,
          flipOnTouch: false,
          front: SignIn(onFlip: () => cardKey.currentState?.toggleCard()),
          back: SignUp(onFlip: () => cardKey.currentState?.toggleCard()),
        ),
      ),
    );
  }
}

