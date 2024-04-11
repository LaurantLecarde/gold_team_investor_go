import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gold_team_investor_go/gold_team/presentation/screens/drawer_screens/lessons/levels_screens/a_level_one.dart';
import 'package:gold_team_investor_go/gold_team/presentation/screens/drawer_screens/lessons/levels_screens/b_level_two.dart';
import 'package:gold_team_investor_go/gold_team/presentation/screens/drawer_screens/lessons/levels_screens/c_level_three.dart';
import 'package:gold_team_investor_go/gold_team/presentation/screens/drawer_screens/lessons/levels_screens/d_level_four.dart';
import 'package:gold_team_investor_go/gold_team/presentation/screens/drawer_screens/lessons/levels_screens/e_level_five.dart';
import 'package:gold_team_investor_go/gold_team/presentation/screens/drawer_screens/lessons/levels_screens/f_level_six.dart';
import 'package:gold_team_investor_go/gold_team/presentation/screens/drawer_screens/lessons/levels_screens/g_level_seven.dart';
import 'package:gold_team_investor_go/gold_team/presentation/widgets/app_bar_app.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constants/colors.dart';

class VideoLesson extends StatefulWidget {
  const VideoLesson({super.key});

  @override
  State<VideoLesson> createState() => _VideoLessonState();
}

class _VideoLessonState extends State<VideoLesson> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBarApp(title: "VIDEO DARSLAR"),
        body: _lessonSection(),
      ),
    );
  }
  _lessonSection(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Gap(5),
          Container(
            height: 70,width: double.infinity,
            child: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                  color: Colors.lightBlue.shade50,
                  borderRadius: BorderRadius.circular(10)
              ),
              labelStyle: GoogleFonts.nunitoSans(
                  color: Colors.indigoAccent,
                  fontWeight:FontWeight.bold,
                  fontSize:15
              ),
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
          Expanded(child: TabBarView(
            children: [
              OneLevel(),
              TwoLevel(),
              ThreeLevel(),
              FourLevel(),
              FiveLevel(),
              SixLevel(),
              SevenLevel()
            ],
          ),)
        ],
      ),
    );
  }
}
