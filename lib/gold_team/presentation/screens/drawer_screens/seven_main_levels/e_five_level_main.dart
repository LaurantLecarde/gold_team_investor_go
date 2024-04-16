import 'package:flutter/material.dart';

class FiveLevelMain extends StatefulWidget {
  const FiveLevelMain({super.key});

  @override
  State<FiveLevelMain> createState() => _OneLevelMainState();
}

class _OneLevelMainState extends State<FiveLevelMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("5"),),
    );
  }
}
