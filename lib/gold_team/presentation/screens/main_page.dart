import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gold_team_investor_go/gold_team/constants/colors.dart';
import 'package:gold_team_investor_go/gold_team/presentation/widgets/app_bar_app.dart';
import '../widgets/golden_drawer.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainTheme(context),
      appBar: GradientAppBarMain(
        gradient: LinearGradient(
          colors: [
            Color(0xff1d2b62),
            Color(0xff4f315f)
          ], // Your custom gradient colors
          begin: Alignment.centerLeft,
          end: Alignment.bottomRight,
        ),
        title: Text(
          "ASOSIY SAHIFA",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(CupertinoIcons.list_bullet_indent,
                  color: Colors.white, size: 30),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: GoldenDrawer(),
      body: Center(
        child: Text(""),
      ),
    );
  }
}
