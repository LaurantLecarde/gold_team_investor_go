import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gold_team_investor_go/gold_team/constants/colors.dart';
import 'package:gold_team_investor_go/gold_team/constants/navigators.dart';
import 'package:gold_team_investor_go/gold_team/constants/sizes_app.dart';
import 'package:gold_team_investor_go/gold_team/presentation/screens/add_screens/no_internet.dart';
import 'package:gold_team_investor_go/gold_team/presentation/widgets/app_bar_app.dart';
import 'package:gold_team_investor_go/gold_team/presentation/widgets/glow_button_toggle.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

import '../../../model/conntectivity_class.dart';
import '../auth_page/flip_log_reg.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _obscurePassword = true;
  final TextEditingController _usernameController =
      TextEditingController(text: "Sardorbek");
  final TextEditingController _emailController =
      TextEditingController(text: "caburo021990@gmail.com");
  final TextEditingController _phoneController =
      TextEditingController(text: "(94) 562 96 90");
  final TextEditingController _passwordController =
      TextEditingController(text: "Qayta");
  final TextEditingController _cPasswordController =
      TextEditingController(text: "Qayta");
  final TextEditingController _financeController =
      TextEditingController(text: "Finance Parol");
  final TextEditingController _name = TextEditingController(text: "Sardorbek");
  final TextEditingController _surname = TextEditingController(text: "Saidov");
  final TextEditingController _fatherName =
      TextEditingController(text: "Karimjon O'g'li");

  var mask = MaskTextInputFormatter(mask: "(##) ### ## ##");

  List<String> uzbekistanRegions = [
    'Andijon',
    'Buxoro',
    'Farg\'ona',
    'Jizzax',
    'Qoraqalpog\'ston',
    'Xorezm',
    'Namangan',
    'Navoiy',
    'Qashqadaryo',
    'Samarqand',
    'Sirdaryo',
    'Surxondaryo',
    'Toshkent',
  ];
  String _district = "Andijon";

  @override
  Widget build(BuildContext context) {
    var connectivityService = Provider.of<ConnectivityService>(context);

    return Scaffold(
      extendBody: true,
      backgroundColor: mainTheme(context),
      appBar: AppBarApp(title: "MENING PROFILIM"),
      // body: connectivityService.isConnected ? _profileSection() : NoInternet(),
      body: _profileSection(),
      bottomNavigationBar: _bottom(),
    );
  }

  _bottom() {
    var connectivityService = Provider.of<ConnectivityService>(context);

    return ClipRect(
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
              child: connectivityService.isConnected
                  ? LogRegButton(
                      onTap: () {},
                      text: "SAQLASH",
                    )
                  : Center(
                      child: Text("Internet Mavjud Emas",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunitoSans(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                    ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _profileSection() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _imageSection(),
          const Gap(20),
          _infoSection(),
          const Gap(30),
          _logOutButton(),
          const Gap(90),
        ],
      ),
    );
  }

  Widget _imageSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      height: 235,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.black26, spreadRadius: 5, blurRadius: 5)
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 110,
            width: 110,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(color: Colors.black26, spreadRadius: 5, blurRadius: 5)
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(100),
            ),
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
          _titleText("Sardorbek"),
          _subtitleText("caburo021990@gmail.com"),
        ],
      ),
    );
  }

  Widget _infoSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _infoTextField(Colors.lightBlue.shade100, _usernameController,
            "Username", Icon(Icons.person), 18, Colors.black, true),
        _infoTextField(Colors.lightBlue.shade100, _emailController, "Email",
            Icon(Icons.email_outlined), 18, Colors.black, true),
        const Gap(25),
        _infoTextField(
          Color(0xfffdea98),
          _passwordController,
          "Parol",
          IconButton(
            onPressed: () => _toggleObscurePassword(),
            icon: Icon(_obscurePassword
                ? CupertinoIcons.eye
                : CupertinoIcons.eye_slash),
          ),
          16,
          Colors.black,
          false,
          obscure: _obscurePassword,
        ),
        _infoTextField(
          Color(0xfffdea98),
          _cPasswordController,
          "Parolni Tasdiqlang",
          IconButton(
            onPressed: () => _toggleObscurePassword(),
            icon: Icon(_obscurePassword
                ? CupertinoIcons.eye
                : CupertinoIcons.eye_slash),
          ),
          16,
          Colors.black,
          false,
          obscure: _obscurePassword,
        ),
        _infoTextField(Colors.white, _name, "Ism", Icon(CupertinoIcons.person),
            16, Colors.black, false),
        _infoTextField(Colors.white, _surname, "Familiya",
            Icon(CupertinoIcons.person), 16, Colors.black, false),
        _infoTextField(Colors.white, _fatherName, "Sharf",
            Icon(CupertinoIcons.person), 16, Colors.black, false),
        _phoneTextField(),
        _districtSection(),
        _infoTextField(Colors.white, _financeController, "Finans Parol",
            Icon(Icons.lock), 16, Colors.black, false),
      ],
    );
  }

  Widget _logOutButton() {
    return Container(
      width: 150,
      height: 60,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.black26, spreadRadius: 5, blurRadius: 5)
        ],
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        onPressed: _showLogOutDialog,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
              width: 20,
              child: Image.asset("assets/icons/logout.png",
                  fit: BoxFit.cover, color: Colors.red),
            ),
            Text(
              "  CHIQISH",
              style: GoogleFonts.nunitoSans(
                  color: Colors.red, fontWeight: FontWeight.bold, fontSize: 15),
            )
          ],
        ),
      ),
    );
  }

  Widget _infoTextField(
      Color fillColor,
      TextEditingController controller,
      String initialText,
      Widget suffix,
      double fontSize,
      Color textColor,
      bool readOnly,
      {bool obscure = false}) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(color: Colors.black26, spreadRadius: 3, blurRadius: 3)
          ],
        ),
        height: 65,
        width: double.infinity,
        child: Center(
          child: TextField(
            obscureText: obscure,
            style: GoogleFonts.nunitoSans(fontSize: fontSize, color: textColor),
            controller: controller,
            readOnly: readOnly,
            cursorColor: Colors.black,
            decoration: InputDecoration(
              hintText: initialText,
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
            ),
          ),
        ),
      ),
    );
  }

  Widget _phoneTextField() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(color: Colors.black26, spreadRadius: 3, blurRadius: 3)
          ],
        ),
        height: 65,
        width: double.infinity,
        child: Center(
          child: TextField(
            inputFormatters: [mask],
            keyboardType: TextInputType.number,
            style: GoogleFonts.nunitoSans(fontSize: 16, color: Colors.black),
            controller: _phoneController,
            cursorColor: Colors.black,
            decoration: InputDecoration(
              hintText: "Telefon Raqam",
              prefixIcon: Container(
                width: 40,
                child: Center(
                  child: Text(
                    "+998 ",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.nunitoSans(fontSize: 16),
                  ),
                ),
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
            ),
          ),
        ),
      ),
    );
  }

  void _toggleObscurePassword() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  Widget _titleText(String title) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: GoogleFonts.nunitoSans(
            fontWeight: FontWeight.bold, fontSize: 23, color: Colors.black),
      ),
    );
  }

  Widget _subtitleText(String subTitle) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        subTitle,
        textAlign: TextAlign.center,
        style: GoogleFonts.nunitoSans(fontSize: 15, color: Colors.black),
      ),
    );
  }

  _showLogOutDialog() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            contentPadding: EdgeInsets.zero,
            backgroundColor: Colors.indigoAccent,
            content: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12), color: Colors.white),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: size(context).width / 2,
                    child: Text(
                      "Rostdan Ham Chiqib Ketmoqchimisiz ?",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.nunitoSans(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const Gap(15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 55,
                        width: 100,
                        child: _logOutButtonBuilder(
                            "YO'Q",
                            CupertinoColors.systemGreen,
                            Colors.white,
                            () => navPop(context)),
                      ),
                      SizedBox(
                        height: 55,
                        width: 100,
                        child: _logOutButtonBuilder(
                            "HA", CupertinoColors.systemRed, Colors.white, () {
                          navPushAndRemoveSmallToFull(
                              context, LoginRegisterFlip());
                        }),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

  _logOutButtonBuilder(
      String text, Color bColor, Color tColor, void Function()? onPressed) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            backgroundColor: bColor),
        child: Text("$text",
            style: TextStyle(color: tColor, fontWeight: FontWeight.bold)));
  }

  _districtSection() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black26, spreadRadius: 3, blurRadius: 3)
          ],
        ),
        height: 65,
        width: double.infinity,
        child: PopupMenuButton(
          color: Colors.white,
          itemBuilder: (BuildContext context) {
            return uzbekistanRegions.map((String uzbekistanRegions) {
              return PopupMenuItem<String>(
                value: uzbekistanRegions,
                child: Text(
                  "$uzbekistanRegions Viloyati",
                  style: GoogleFonts.nunitoSans(),
                ),
              );
            }).toList();
          },
          onSelected: (String value) {
            setState(() {
              _district = value;
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "$_district Viloyati",
                style:
                    GoogleFonts.nunitoSans(fontSize: 16, color: Colors.black),
              ),
              Icon(CupertinoIcons.arrowtriangle_down_fill)
            ],
          ),
        ),
      ),
    );
  }
}
