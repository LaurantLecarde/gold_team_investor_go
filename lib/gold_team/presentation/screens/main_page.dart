import 'package:flutter/material.dart';
import 'package:gold_team_investor_go/gold_team/constants/colors.dart';
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
      backgroundColor: mainTheme(context),
      appBar: AppBar(),
      drawer: GoldenDrawer(),
      body: Center(
        child: Text("Hello world"),
      ),
    );
  }
}
