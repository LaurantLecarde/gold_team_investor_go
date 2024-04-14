
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gold_team_investor_go/gold_team/constants/colors.dart';
import 'package:gold_team_investor_go/gold_team/presentation/widgets/app_bar_app.dart';
import 'package:gold_team_investor_go/gold_team/presentation/widgets/workers/circle_text.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants/navigators.dart';
import '../auth_page/sign_up_screens/about_company.dart';
import '../auth_page/sign_up_screens/privacy_policy.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarApp(title: "YORDAM"),
      backgroundColor: mainTheme(context),
      body: _helpSection(),
    );
  }

  String developer = "life_is_pain_0_untxc";
  String admin = "caburaa";

  void _launchTelegram(String link) async {
    final url = 'https://t.me/$link';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url  aOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO';
    }
  }

  _helpSection() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Gap(30),
          _helpBuilder("Ommaviy Offerta", _assets("privacy"),Colors.indigoAccent,()=>navPush(context,PrivacyPolicy()),wantColor: true),
          _helpBuilder("Kompaniya Haqida", _assets("about"),Colors.indigoAccent,()=>navPush(context,AboutCompany()),wantColor: true),
          _helpBuilder("Kompaniya Admini Bilan Bog'lanish", _assets("telegram"),Colors.white,(){_launchTelegram(admin);}),
          _helpBuilder("Yaratuvchi Bilan Bog'lanish", _assets("telegram"),Colors.white,(){_launchTelegram(developer);}),
        ],
      ),
    );
  }

  _assets(String icon){
    String newIcon = "assets/icons/${icon}.png";
  return newIcon;
  }

  _helpBuilder(String text, String image,Color color,void Function()? onPressed,{bool wantColor = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Container(
        // padding: EdgeInsets.symmetric(vertical: 22),
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(color: Colors.black26, spreadRadius: 5, blurRadius: 5)
        ], borderRadius: BorderRadius.circular(12), color: Colors.white),
        child: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
            onPressed: onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: SizedBox(
                    width: 180,
                    child: CircleText(
                      text: text,
                      width: 150,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigoAccent,
                    ),
                  ),
                ),
                SizedBox(
                    height: 35,
                    width: 35,
                    child: Image.asset(
                      image,
                      fit: BoxFit.cover,
                      color: wantColor ? color : null,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
