import 'package:flutter/material.dart';
import 'package:gold_team_investor_go/gold_team/presentation/widgets/workers/main_page_user_section_builder.dart';

class OneLevelMain extends StatefulWidget {
  const OneLevelMain({super.key});

  @override
  State<OneLevelMain> createState() => _OneLevelMainState();
}

class _OneLevelMainState extends State<OneLevelMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: HandedUsersBuilder()),
    );
  }
}
