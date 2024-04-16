import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:gold_team_investor_go/gold_team/constants/colors.dart';
import 'package:gold_team_investor_go/gold_team/constants/sizes_app.dart';
import 'package:gold_team_investor_go/gold_team/exe_directory/exe_handed_users.dart';
import 'package:gold_team_investor_go/gold_team/presentation/widgets/app_bar_app.dart';
import 'package:gold_team_investor_go/gold_team/presentation/widgets/glow_button_toggle.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:showcaseview/showcaseview.dart';

class DetailedUser extends StatefulWidget {
  const DetailedUser({super.key, required this.myUser});

  final MyUser myUser;

  @override
  State<DetailedUser> createState() => _DetailedUserState();
}

class _DetailedUserState extends State<DetailedUser> {
  final GlobalKey _one = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainTheme(context),
      appBar: AppBarApp(
        title: "${widget.myUser.username}",
      ),
      body: _handSection(),
    );
  }

  _handSection() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Gap(20),
          _cloneSection(),
          const Gap(20),
          _searchSection(),
          const Gap(30),
          _handedUserSection(),
          const Gap(90)
        ],
      ),
    );
  }

  _cloneSection() {
    return Container(
      width: size(context).width / 1.2,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Color(0xffcde0f6), borderRadius: BorderRadius.circular(15)),
      child: Text(
        "Hurmatli foydalanuvchi, faqat 1-bosqichdan klon xarid qilishingiz mumkin! Klon xarid qilishda shaxsiy yoki bonus hisobingizda yetarlicha mablag' bo'lishi shart.",
        style: GoogleFonts.nunitoSans(color: Color(0xff044593)),
      ),
    );
  }

  _searchSection() {
    return Column(
      children: [
        SizedBox(
          height: 60,
          child: TextField(
            cursorColor: Colors.black,
            decoration: InputDecoration(
              hintText: "Username",
              hintStyle: GoogleFonts.nunitoSans(),
              fillColor: Colors.white,
              filled: true,
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.black38, width: 3)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black26),
                  borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ),
        const Gap(15),
        SizedBox(
            height: 55,
            width: 130,
            child: LogRegButton(text: "Izlash", onTap: () {}))
      ],
    );
  }

  _handedUserSection() {
    return Container(
      height: 500,
      padding: EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black26, blurRadius: 2, spreadRadius: 2)
          ]),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Gap(15),
            Container(
              height: 70,
              width: 70,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100)),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black26),
                    color: mainTheme(context),
                    borderRadius: BorderRadius.circular(100)),
                child: Center(
                  child: Icon(
                    Icons.person,
                    size: 45,
                  ),
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                  _showUserWork("${widget.myUser.username}");
                },
                child: Text("${widget.myUser.username}",
                    style: GoogleFonts.nunitoSans(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.indigoAccent))),
            const Gap(10),
            const Gap(15),
            SizedBox(
              height: 400,
              width: double.infinity,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  final handedUsers = widget.myUser.handedUsers;
                  if (handedUsers == null || index >= handedUsers.length) {
                    return _buildRedIcon();
                  }
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: _buildGreenIcon(index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGreenIcon(int index) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Padding(
        padding: const EdgeInsets.only(right: 13.0),
        child: Column(
          children: [
            Container(
              height: 60,
              width: 60,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100)),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black26),
                    color: mainTheme(context),
                    borderRadius: BorderRadius.circular(100)),
                child: Center(
                  child: Icon(
                    Icons.person,
                    size: 40,
                  ),
                ),
              ),
            ),
            const Gap(10),
            TextButton(
                onPressed: () {},
                child: Text("${widget.myUser.handedUsers![index]}",
                    style: GoogleFonts.nunitoSans(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: CupertinoColors.systemGreen)))
          ],
        ),
      ),
    );
  }

  Widget _buildRedIcon() {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Padding(
        padding: const EdgeInsets.only(right: 13.0),
        child: Column(
          children: [
            Container(
              height: 60,
              width: 60,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100)),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black26),
                    color: mainTheme(context),
                    borderRadius: BorderRadius.circular(100)),
                child: Center(
                  child: Icon(
                    Icons.person,
                    size: 40,
                  ),
                ),
              ),
            ),
            const Gap(10),
            TextButton(
                onPressed: () {},
                child: Text(
                  "Yo'q",
                  style: GoogleFonts.nunitoSans(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: CupertinoColors.destructiveRed),
                ))
          ],
        ),
      ),
    );
  }

  _showUserWork(String username) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              contentPadding: EdgeInsets.zero,
              content: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: mainTheme(context)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Gap(30),
                    Text(username,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25)),

                    const Gap(10),
                    Container(
                      height: 65,
                      width: 200,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                          child: Text(
                        "${widget.myUser.handedUsers?.length} ta qo'li band",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      )),
                    ),
                    const Gap(30),
                  ],
                ),
              ),
            ));
  }
}
