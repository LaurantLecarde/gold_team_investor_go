import 'package:flutter/material.dart';
import 'package:gold_team_investor_go/gold_team/constants/colors.dart';
import 'package:gold_team_investor_go/gold_team/constants/navigators.dart';
import 'package:gold_team_investor_go/gold_team/exe_directory/exe_model.dart';
import 'package:gold_team_investor_go/gold_team/presentation/screens/drawer_screens/lessons/detailed_lesson.dart';
import 'package:gold_team_investor_go/gold_team/presentation/widgets/workers/lesson_builder.dart';

class OneLevel extends StatefulWidget {
  const OneLevel({super.key});

  @override
  State<OneLevel> createState() => _FirstLevelState();
}

class _FirstLevelState extends State<OneLevel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mainTheme(context),
        body: LessonBuilder(
          oneLesson: exeLessonList,
        ));
  }
}
