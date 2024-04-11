import 'package:flutter/material.dart';

class SevenLevel extends StatefulWidget {
  const SevenLevel({super.key});

  @override
  State<SevenLevel> createState() => _FirstLevelState();
}

class _FirstLevelState extends State<SevenLevel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("7"),),
    );
  }
}
