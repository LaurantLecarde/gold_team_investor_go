import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

import '../constants/colors.dart';
import 'exe_handed_users.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShowcaseView Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ShowCaseWidget(
        builder: Builder(builder: (context) => HomePage()),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey _one = GlobalKey();
  bool _showInfo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ShowcaseView Example'),
      ),
      body: SizedBox(
        height: 70,
        child:   ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 4, // Since you mentioned itemCount is 4
          itemBuilder: (context, index) {
            final myUser = usersHanded[1];
            final handedUsers = myUser.handedUsers;

            if (handedUsers == null || index >= handedUsers.length) {
              // If handedUsers is null or index is out of bounds, return red icon
              return _buildRedIcon();
            }

            final user = handedUsers[index];

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: _buildGreenIcon(),
            );
          },
        ),
      ),
    );
  }

  Widget _buildGreenIcon() {
    return Container(
      height: 55,
      width: 55,
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: mainTheme(context),
          border: Border.all(color: CupertinoColors.activeGreen),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: Icon(
            CupertinoIcons.person_crop_circle_badge_checkmark,
            size: 40,
            color: Colors.green,
          ),
        ),
      ),
    );
  }

  Widget _buildRedIcon() {
    return Container(
      height: 55,
      width: 55,
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.red,
          border: Border.all(color: Colors.red),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: Icon(
            CupertinoIcons.person_crop_circle_badge_checkmark,
            size: 40,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
