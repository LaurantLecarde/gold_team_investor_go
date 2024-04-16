import 'package:flutter/material.dart';

class SixLevelMain extends StatefulWidget {
  const SixLevelMain({super.key});

  @override
  State<SixLevelMain> createState() => _OneLevelMainState();
}

class _OneLevelMainState extends State<SixLevelMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("6"),),
    );
  }
}
