import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gold_team_investor_go/gold_team/presentation/screens/sign_in_screens/sign_in.dart';
import 'package:gold_team_investor_go/gold_team/presentation/screens/sign_up_screens/privacy_policy.dart';
import 'package:gold_team_investor_go/gold_team/presentation/widgets/glow_button_toggle.dart';
import 'package:gold_team_investor_go/gold_team/presentation/widgets/navigators.dart';
import 'package:gold_team_investor_go/gold_team/presentation/widgets/open_container.dart';
import 'package:gold_team_investor_go/gold_team/presentation/widgets/sign_password_text_field.dart';
import 'package:gold_team_investor_go/gold_team/presentation/widgets/sign_text_field.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  var myGradient = const LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [Color(0xff8ca8fa), Color(0xffb38cd4)]);

  bool passIcon = true;
  bool confPassIcon = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _signUp(),
    );
  }

  _signUp() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration:BoxDecoration(
          gradient: myGradient),
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Gap(30),
              Text("Xush Kelibsiz!",
                  style: GoogleFonts.nunitoSans(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              const Gap(10),
              Text("Ilovani Ishga Tushurishdan Oldin Registratsiyadan O'ting",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunitoSans(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              const Gap(20),
              SignTextFieldWidget(
                  hint: "Username",
                  leading: const Icon(Icons.person_rounded),
                  controller: _username),
              SignTextFieldWidget(
                  hint: "Email",
                  controller: _email,
                  leading: const Icon(Icons.email)),
              SignTextFieldWidget(
                  hint: "Telefon Raqam",
                  leading: const Icon(Icons.phone),
                  controller: _phone),
              PasswordTextFieldWidget(
                  close: passIcon,
                  hint: "Parol",
                  leading: const Icon(Icons.lock),
                  controller: _password,
                  prefIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          passIcon = !passIcon;
                        });
                      },
                      icon: Icon(passIcon
                          ? CupertinoIcons.eye_fill
                          : CupertinoIcons.eye_slash))),
              PasswordTextFieldWidget(
                  close: confPassIcon,
                  hint: "Parolni Tasdiqlang",
                  leading: const Icon(Icons.lock),
                  controller: _confirmPassword,
                  prefIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          confPassIcon = !confPassIcon;
                        });
                      },
                      icon: Icon(confPassIcon
                          ? CupertinoIcons.eye_fill
                          : CupertinoIcons.eye_slash))),
              const Gap(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Akkauntingiz bormi ?   ",
                      style: GoogleFonts.nunitoSans(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  const OpenContainerToggling(text: "Login", to: SignIn())
                ],
              ),
              const Gap(30),
               SizedBox(
                height: 55,
                width: double.infinity,
                child: LogRegButton(text: "Register",onTap: (){},),
              ),
              const Gap(15),
              Text("Registratsiya Qilish Orqali Siz ",
                  style: GoogleFonts.nunitoSans(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              InkWell(
                  onTap: () =>navPush(context, PrivacyPolicy()),
                  child: Text(" Ommaviy Offertaga ",
                      style: GoogleFonts.nunitoSans(
                          fontSize: 14,
                          color: Colors.indigoAccent,
                          fontWeight: FontWeight.bold))),
              Text(" Rozi Bo'lasiz",
                  style: GoogleFonts.nunitoSans(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}