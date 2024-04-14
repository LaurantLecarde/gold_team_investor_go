import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gold_team_investor_go/gold_team/constants/colors.dart';
import 'package:gold_team_investor_go/gold_team/presentation/screens/drawer_screens/bonus_history.dart';
import 'package:gold_team_investor_go/gold_team/presentation/screens/drawer_screens/help.dart';
import 'package:gold_team_investor_go/gold_team/presentation/screens/drawer_screens/orders.dart';
import 'package:gold_team_investor_go/gold_team/presentation/screens/drawer_screens/payment_history.dart';
import 'package:gold_team_investor_go/gold_team/presentation/screens/drawer_screens/payment_screen.dart';
import 'package:gold_team_investor_go/gold_team/constants/navigators.dart';
import 'package:gold_team_investor_go/gold_team/presentation/screens/drawer_screens/profile.dart';
import 'package:gold_team_investor_go/gold_team/presentation/screens/drawer_screens/lessons/video_lessons.dart';
import 'package:gold_team_investor_go/gold_team/presentation/widgets/workers/circle_text.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/main_page.dart';

class GoldenDrawer extends StatelessWidget {
  const GoldenDrawer({Key? key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: mainTheme(context),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(color: mainTheme(context)),
              child: DrawerHeader(
                margin: EdgeInsets.all(0),
                padding: EdgeInsets.all(0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(color: Colors.black26, spreadRadius: 4, blurRadius: 4),
                      ],
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            height: 100,
                            width: 100,
                            child: Image.asset("assets/icons/profile_drawer.png"),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Sardorbek",
                              style: GoogleFonts.nunitoSans(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            const Gap(10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: Image.asset(
                                    "assets/icons/money.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  "Shaxsiy Hisob",
                                  style: GoogleFonts.nunitoSans(fontSize: 12),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 50,
                              width: 100,
                              child: CircleText(
                                text: "13 793 000 so'm",
                                width: 100,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Gap(20),
                  _itemDrawer("assets/icons/main.png", "Asosiy", () => navPushAndRemove(context, MainPage())),
                  _itemDrawer("assets/icons/profile.png", "Profile", () => navPush(context, ProfileScreen())),
                  _itemDrawer("assets/icons/full_balance.png", "Hisobni To'ldirish", () => navPush(context, PaymentScreen())),
                  _itemDrawer("assets/icons/payment.png", "To'lovni Chiqarish", () {}),
                  _itemDrawer("assets/icons/delivery.png", "Buyurtmalar", () => navPush(context, OrdersScreen())),
                  _itemDrawer("assets/icons/payment_history.png", "To'lov Tarixi", () => navPush(context, PaymentHistory())),
                  _itemDrawer("assets/icons/bonus.png", "Bonus Tarixi", () => navPush(context, BonusHistory())),
                  _itemDrawer("assets/icons/video.png", "Video Darslar", () => navPush(context, VideoLesson())),
                  const Gap(20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Divider(thickness: 3, color: Colors.black12),
                  ),
                  const Gap(20),
                  _itemDrawerInfo("Yordam", () => navPush(context, HelpScreen())),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemDrawer(String imagePath, String name, void Function()? onTap) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(color: Colors.black26, spreadRadius: 2, blurRadius: 2),
            ],
            borderRadius: BorderRadius.circular(12),
            gradient: myGradientC(),
          ),
          padding: EdgeInsets.all(5),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: Colors.white54,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 25,
                      width: 25,
                      child: Image.asset(
                        imagePath,
                        color: Colors.indigoAccent,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Gap(15),
                    Text(
                      name,
                      style: GoogleFonts.nunitoSans(
                        color: Colors.indigoAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                Icon(
                  CupertinoIcons.forward,
                  color: Colors.indigoAccent,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _itemDrawerInfo(String name, void Function()? onTap) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: myGradientC(),
          ),
          padding: EdgeInsets.all(5),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: Colors.white54,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 25,
                      width: 25,
                      child: Image.asset(
                        "assets/icons/help.png",
                        color: Colors.indigoAccent,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Gap(15),
                    Text(
                      name,
                      style: GoogleFonts.nunitoSans(
                        color: Colors.indigoAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                Icon(
                  CupertinoIcons.forward,
                  color: Colors.indigoAccent,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
