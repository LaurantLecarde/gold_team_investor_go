import 'package:flutter/material.dart';

class SixLevel extends StatefulWidget {
  const SixLevel({super.key});

  @override
  State<SixLevel> createState() => _FirstLevelState();
}

class _FirstLevelState extends State<SixLevel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("6"),),
    );
  }
}
