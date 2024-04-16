import 'package:flutter/material.dart';

class SevenLevelMain extends StatefulWidget {
  const SevenLevelMain({super.key});

  @override
  State<SevenLevelMain> createState() => _OneLevelMainState();
}

class _OneLevelMainState extends State<SevenLevelMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("7"),),
    );
  }
}
