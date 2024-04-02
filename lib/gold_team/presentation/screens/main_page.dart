import 'package:flutter/material.dart';
import '../widgets/golden_drawer.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      drawer: GoldenDrawer(),
      body: Center(
        child: Text("Hello world"),
      ),
    );
  }
}
