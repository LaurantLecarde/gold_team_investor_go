import 'package:flutter/material.dart';

class TwoLevel extends StatefulWidget {
  const TwoLevel({super.key});

  @override
  State<TwoLevel> createState() => _FirstLevelState();
}

class _FirstLevelState extends State<TwoLevel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("2"),),
    );
  }
}
