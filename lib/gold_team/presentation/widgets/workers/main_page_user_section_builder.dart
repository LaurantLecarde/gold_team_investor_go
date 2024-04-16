import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/navigators.dart';
import '../../../constants/sizes_app.dart';
import '../../../exe_directory/exe_handed_users.dart';
import '../../screens/add_screens/show_case_screen.dart';

HandedUsersBuilder() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: ListView.builder(
        itemCount: usersHanded.length,
        itemBuilder: (context, index) {
          final myUser = usersHanded[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 3),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                      color: mainTheme(context),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                            15,
                          ),
                          topRight: Radius.circular(15))),
                  child: Center(
                    child: TextButton(
                      onPressed: () =>
                          navPush(context, ShowCaseScreen(myUser: myUser)),
                      child: Text("${myUser.username}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.indigoAccent,
                              fontSize: 20)),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 230,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15)),
                    gradient: myGradientC(),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 65,
                        width: 65,
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100)),
                        child: Container(
                          decoration: BoxDecoration(
                              color: mainTheme(context),
                              border: Border.all(
                                  color: CupertinoColors.activeGreen),
                              borderRadius: BorderRadius.circular(100)),
                          child: Center(
                            child: Icon(
                              CupertinoIcons.person_crop_circle_badge_checkmark,
                              size: 40,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 55,
                        width: size(context).width / 1.6,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 4, // Since you mentioned itemCount is 4
                          itemBuilder: (context, index) {
                            final handedUsers = myUser.handedUsers;

                            if (handedUsers == null ||
                                index >= handedUsers.length) {
                              // If handedUsers is null or index is out of bounds, return red icon
                              return _buildRedIcon(context);
                            }

                            final user = handedUsers[index];

                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: _buildGreenIcon(context),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
  );
}

Widget _buildGreenIcon(context) {
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

Widget _buildRedIcon(context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5),
    child: Container(
      height: 55,
      width: 55,
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(100)),
      child: Container(
        decoration: BoxDecoration(
            color: mainTheme(context),
            border: Border.all(color: CupertinoColors.destructiveRed),
            borderRadius: BorderRadius.circular(100)),
        child: Center(
          child: Icon(
            CupertinoIcons.person_crop_circle_badge_xmark,
            size: 40,
            color: Colors.red,
          ),
        ),
      ),
    ),
  );
}
