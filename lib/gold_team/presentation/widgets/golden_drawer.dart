import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:gold_team_investor_go/gold_team/constants/colors.dart';
import 'package:gold_team_investor_go/gold_team/presentation/screens/drawer_screens/payment_screen.dart';
import 'package:gold_team_investor_go/gold_team/constants/navigators.dart';
import 'package:google_fonts/google_fonts.dart';

class GoldenDrawer extends StatelessWidget {
  const GoldenDrawer({super.key});

  @override
  Widget build(BuildContext context) {


    return Drawer(
      backgroundColor: mainTheme(context),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: mainTheme(context)),
            child: DrawerHeader(
                margin: EdgeInsets.all(0),
                padding: EdgeInsets.all(0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 15),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey.shade300,
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
                              child: Image.asset(
                                  "assets/icons/profile_drawer.png")),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Sardorbek",
                                style: GoogleFonts.nunitoSans(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                            const Gap(10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: Image.asset("assets/icons/money.png",
                                      fit: BoxFit.cover),
                                ),
                                Text("Shaxsiy Hisob",
                                    style:
                                        GoogleFonts.nunitoSans(fontSize: 12)),
                              ],
                            ),
                            SizedBox(
                              height: 50,
                              width: 100,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  Text("13 000 000 000 000 so'm",
                                      overflow: TextOverflow.clip,
                                      style: GoogleFonts.nunitoSans(fontSize: 12)),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _itemDrawer("assets/icons/main.png", "Asosiy", () {}),
                _itemDrawer("assets/icons/profile.png", "Profile", () {}),
                _itemDrawer(
                    "assets/icons/full_balance.png",
                    "Hisobni To'ldirish",
                    () => navPush(context, PaymentScreen())),
                _itemDrawer(
                    "assets/icons/payment.png", "To'lovni Chiqarish", () {}),
                _itemDrawer("assets/icons/delivery.png", "Buyurtmalar", () {}),
                _itemDrawer(
                    "assets/icons/payment_history.png", "To'lov Tarixi", () {}),
                _itemDrawer("assets/icons/bonus.png", "Bonus Tarixi", () {}),
                _itemDrawer("assets/icons/video.png", "Video Darslar", () {}),
                const Gap(20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Divider(thickness: 3, color: Colors.black12),
                ),
                const Gap(20),
                _itemDrawerInfo("Yordam", () {})
              ],
            ),
          )
        ],
      ),
    );
  }

  _itemDrawer(String imagePath, String name, void Function()? onTap) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), gradient: myGradientC()),
          padding: EdgeInsets.all(5),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
                color: Colors.white54, borderRadius: BorderRadius.circular(12)),
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
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Icon(
                  CupertinoIcons.forward,
                  color: Colors.indigoAccent,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _itemDrawerInfo(String name, void Function()? onTap) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), gradient: myGradientC()),
        padding: EdgeInsets.all(5),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
              color: Colors.white54, borderRadius: BorderRadius.circular(12)),
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
                    child: Image.asset("assets/icons/help.png",
                        color: Colors.indigoAccent, fit: BoxFit.cover),
                  ),
                  const Gap(15),
                  Text(
                    name,
                    style: GoogleFonts.nunitoSans(
                        color: Colors.indigoAccent,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Icon(
                CupertinoIcons.forward,
                color: Colors.indigoAccent,
              )
            ],
          ),
        ),
      ),
    );
  }
}
