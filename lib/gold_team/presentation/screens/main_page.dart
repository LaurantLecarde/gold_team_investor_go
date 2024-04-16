import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gold_team_investor_go/gold_team/constants/colors.dart';
import 'package:gold_team_investor_go/gold_team/constants/navigators.dart';
import 'package:gold_team_investor_go/gold_team/constants/sizes_app.dart';
import 'package:gold_team_investor_go/gold_team/exe_directory/exe_handed_users.dart';
import 'package:gold_team_investor_go/gold_team/presentation/screens/add_screens/detailed_user.dart';
import 'package:gold_team_investor_go/gold_team/presentation/screens/add_screens/no_internet.dart';
import 'package:gold_team_investor_go/gold_team/presentation/screens/add_screens/show_case_screen.dart';
import 'package:gold_team_investor_go/gold_team/presentation/screens/drawer_screens/seven_main_levels/a_one_level_main.dart';
import 'package:gold_team_investor_go/gold_team/presentation/screens/drawer_screens/seven_main_levels/b_two_level_main.dart';
import 'package:gold_team_investor_go/gold_team/presentation/screens/drawer_screens/seven_main_levels/c_three_level_main.dart';
import 'package:gold_team_investor_go/gold_team/presentation/screens/drawer_screens/seven_main_levels/d_four_level_main.dart';
import 'package:gold_team_investor_go/gold_team/presentation/screens/drawer_screens/seven_main_levels/e_five_level_main.dart';
import 'package:gold_team_investor_go/gold_team/presentation/screens/drawer_screens/seven_main_levels/g_six_level_main.dart';
import 'package:gold_team_investor_go/gold_team/presentation/screens/drawer_screens/seven_main_levels/h_seven_level_main.dart';
import 'package:gold_team_investor_go/gold_team/presentation/widgets/app_bar_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:showcaseview/showcaseview.dart';
import '../../model/conntectivity_class.dart';
import '../widgets/golden_drawer.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    var connectivityService = Provider.of<ConnectivityService>(context);
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        backgroundColor: Colors.white,
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
        drawer: connectivityService.isConnected ? GoldenDrawer() : AppBar(),
        body: _mainSection(),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ElevatedButton(
            onPressed: () => navPush(context, NoInternet()),
            child: Text("NOInternet"),
          ),
        ),
      ),
    );
    // : NoInternet();
  }

  _mainSection(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 70,
          width: double.infinity,
          child: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
                color: Colors.lightBlue.shade50,
                borderRadius: BorderRadius.circular(10)),
            labelStyle: GoogleFonts.nunitoSans(
                color: Colors.indigoAccent,
                fontWeight: FontWeight.bold,
                fontSize: 15),
            isScrollable: true,
            tabs: [
              Tab(text: '1-Bosqich'),
              Tab(text: '2-Bosqich'),
              Tab(text: '3-Bosqich'),
              Tab(text: '4-Bosqich'),
              Tab(text: '5-Bosqich'),
              Tab(text: '6-Bosqich'),
              Tab(text: '7-Bosqich'),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            children: [
              OneLevelMain(),
              TwoLevelMain(),
              ThreeLevelMain(),
              FourLevelMain(),
              FiveLevelMain(),
              SixLevelMain(),
              SevenLevelMain()
            ],
          ),
        )
      ],
    );
  }

}
