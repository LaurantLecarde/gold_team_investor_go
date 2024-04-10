import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:gap/gap.dart';
import 'package:gold_team_investor_go/gold_team/constants/colors.dart';
import 'package:gold_team_investor_go/gold_team/constants/navigators.dart';
import 'package:gold_team_investor_go/gold_team/presentation/screens/sign_in_screens/sign_in.dart';
import 'package:gold_team_investor_go/gold_team/presentation/widgets/app_bar_app.dart';
import 'package:gold_team_investor_go/gold_team/presentation/widgets/glow_button_toggle.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: mainTheme(context),
      appBar: AppBarApp(title: "MENING PROFILIM"),
      body: _profileSection(),
      bottomNavigationBar: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Container(
              height: 70,
              padding: EdgeInsets.all(5),
              width: double.infinity,
              color: Colors.transparent,
              child: SizedBox(
                  height: 55,
                  width: double.infinity,
                  child: LogRegButton(text: "SAQLASH", onTap: () {})),
            ),
          ),
        ),
      ),
    );
  }

  _profileSection() {
    return SingleChildScrollView(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _imageSection(),
          const Gap(20),
          _infoSection(),
          const Gap(30),
          _logOut(),
          const Gap(90),
        ],
      ),
    );
  }

  _imageSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        height: 235,
        decoration: BoxDecoration(
            // gradient: myGradientC(),
            boxShadow: [
              BoxShadow(color: Colors.black26, spreadRadius: 5, blurRadius: 5)
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 110,
              width: 110,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(color: Colors.black26, spreadRadius: 5, blurRadius: 5)
              ], color: Colors.white, borderRadius: BorderRadius.circular(100)),
              child: Container(
                height: 100,
                width: 100,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(100)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    "assets/icons/profile_user.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const Gap(20),
            _titleSize("Sardorbek", context),
            _subTitleSize("caburo021990@gmail.com", context)
          ],
        ),
      ),
    );
  }

  _infoSection() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _infoTextF(Colors.lightBlue.shade100, "  Sardorbek",
              Icon(Icons.person), 18, Colors.black, true),
          _infoTextF(
              Color(0xfffdea98),
              "Qandaydir parol",
              IconButton(
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                  icon: Icon(_obscurePassword
                      ? CupertinoIcons.eye
                      : CupertinoIcons.eye_slash)),
              16,
              Colors.black,
              false,
              obscure: _obscurePassword),
          _infoTextF(
              Color(0xfffdea98),
              "Qayta parol",
              IconButton(
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                  icon: Icon(_obscurePassword
                      ? CupertinoIcons.eye
                      : CupertinoIcons.eye_slash)),
              16,
              Colors.black,
              false,
              obscure: _obscurePassword),
          _infoTextF(Colors.lightBlue.shade100, "  caburo021990@gmail.com",
              Icon(Icons.email_outlined), 18, Colors.black, true),
          _phoneTextF(),
          _infoTextF(
              Colors.white,
              "  Andijon Viloyati",
              IconButton(
                  onPressed: () {}, icon: Icon(Icons.arrow_drop_down_sharp)),
              16,
              Colors.black,
              true),
          _infoTextF(Colors.white, "  Finans Parol", Icon(Icons.lock), 16,
              Colors.black, false),
        ],
      ),
    );
  }

  _logOut() {
    return Container(
      width: 150,
      height: 60,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.black26, spreadRadius: 5, blurRadius: 5)
      ], borderRadius: BorderRadius.circular(12), color: Colors.white),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),
        onPressed: () =>navPushAndRemove(context, SignIn()),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                height: 20,
                width: 20,
                child: Image.asset(
                  "assets/icons/logout.png",
                  fit: BoxFit.cover,
                  color: Colors.red,
                )),
            Text("  CHIQISH",
                style: GoogleFonts.nunitoSans(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 15))
          ],
        ),
      ),
    );
  }

  _infoTextF(Color fillColor, String userData, Widget suffix, double fontSize,
      Color textColor, bool readOnly,
      {bool obscure = false}) {
    TextEditingController _username = TextEditingController();
    String user = userData;
    _username.text = user;
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(color: Colors.black26, spreadRadius: 3, blurRadius: 3)
            ]),
        height: 65,
        width: double.infinity,
        child: Center(
          child: TextField(
              obscureText: obscure,
              style:
                  GoogleFonts.nunitoSans(fontSize: fontSize, color: textColor),
              controller: _username,
              readOnly: readOnly,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 12.0), child: suffix),
                filled: true,
                fillColor: fillColor,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.transparent)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.transparent)),
              )),
        ),
      ),
    );
  }

  _phoneTextF() {
    TextEditingController _username = TextEditingController();
    String user = "   (94) 562 96 90";
    _username.text = user;
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(color: Colors.black26, spreadRadius: 3, blurRadius: 3)
            ]),
        height: 65,
        width: double.infinity,
        child: Center(
          child: TextField(
              keyboardType: TextInputType.number,
              style: GoogleFonts.nunitoSans(fontSize: 16, color: Colors.black),
              controller: _username,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                prefixIcon: Container(
                  width: 40,
                  child: Center(
                      child: Text(" +998",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunitoSans(fontSize: 16))),
                ),
                suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: Icon(Icons.phone)),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.transparent)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.transparent)),
              )),
        ),
      ),
    );
  }

  _titleSize(String title, context) {
    final titleTextStyle = GoogleFonts.nunitoSans(
        fontWeight: FontWeight.bold, fontSize: 23, color: Colors.black);
    return SizedBox(
        width: MediaQuery.of(context).size.width / 1.1,
        child: GlowText(
            textAlign: TextAlign.center, title, style: titleTextStyle));
  }

  _subTitleSize(String subTitle, context) {
    final subTitleTextStyle =
        GoogleFonts.nunitoSans(fontSize: 15, color: Colors.black);
    return SizedBox(
        width: MediaQuery.of(context).size.width / 1.1,
        child: GlowText(
            glowColor: Colors.black,
            textAlign: TextAlign.center,
            subTitle,
            style: subTitleTextStyle));
  }
}
