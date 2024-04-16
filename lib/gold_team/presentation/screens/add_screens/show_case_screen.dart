import 'package:flutter/material.dart';
import 'package:gold_team_investor_go/gold_team/exe_directory/exe_handed_users.dart';
import 'package:gold_team_investor_go/gold_team/presentation/screens/add_screens/detailed_user.dart';
import 'package:showcaseview/showcaseview.dart';

class ShowCaseScreen extends StatelessWidget {
  const ShowCaseScreen({super.key, required this.myUser});

  final MyUser myUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ShowCaseWidget(
        builder: Builder(
          builder: (context) => DetailedUser(myUser: myUser),
        ),
      ),
    );
  }
}
