import 'package:flutter/material.dart';

class TwoLevelMain extends StatefulWidget {
  const TwoLevelMain({super.key});

  @override
  State<TwoLevelMain> createState() => _OneLevelMainState();
}

class _OneLevelMainState extends State<TwoLevelMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("2"),),
    );
  }
}
