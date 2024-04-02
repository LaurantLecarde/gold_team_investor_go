
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gold_team_investor_go/gold_team/presentation/screens/main_page.dart';
import 'package:gold_team_investor_go/gold_team/presentation/screens/sign_up_screens/sign_up_screen.dart';
import 'package:gold_team_investor_go/gold_team/presentation/widgets/glow_button_toggle.dart';
import 'package:gold_team_investor_go/gold_team/presentation/widgets/navigators.dart';
import 'package:gold_team_investor_go/gold_team/presentation/widgets/open_container.dart';
import 'package:gold_team_investor_go/gold_team/presentation/widgets/sign_password_text_field.dart';
import 'package:gold_team_investor_go/gold_team/presentation/widgets/sign_text_field.dart';
import 'package:google_fonts/google_fonts.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignUpState();
}

class _SignUpState extends State<SignIn> with SingleTickerProviderStateMixin {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  var myGradient = const LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [Color(0xff8ca8fa), Color(0xffb38cd4)]);

  bool passIcon = true;

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
      decoration: BoxDecoration(gradient: myGradient),
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Gap(30),
              Text("Sizni Yana Ko'rib Turganimizdan Xursandmiz!",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunitoSans(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              const Gap(10),
              Text("Ilovani Ishga Tushurishdan Oldin Login Qiling",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunitoSans(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              const Gap(20),
              SignTextFieldWidget(
                  hint: "Username",
                  controller: _username,
                  leading: const Icon(Icons.person_rounded)),
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
              const Gap(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Hali Yangimisiz ?   ",
                      style: GoogleFonts.nunitoSans(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  const OpenContainerToggling(text: "Register", to: SignUp())
                ],
              ),
              const Gap(30),
               SizedBox(
                  height: 55,
                  width: double.infinity,
                  child: LogRegButton(text: "Login",onTap: ()=>navPush(context,const MainPage()))),
              const Gap(15),
              InkWell(
                onTap: () =>_showPasswordDialog(context),
                child: Text("Parol Esingizdan Chiqdimi ?",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.nunitoSans(
                        color: Colors.indigoAccent,
                        fontWeight: FontWeight.bold)),
              )
            ],
          ),
        ),
      ),
    );
  }

  _showPasswordDialog(context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            contentPadding: EdgeInsets.zero,
            backgroundColor: Colors.indigoAccent,
            content: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: myGradient),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Parolni Bilish",
                          textAlign: TextAlign.start,
                          style: GoogleFonts.nunitoSans(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25)),
                    IconButton(onPressed: ()=>navPop(context), icon: const Icon(CupertinoIcons.xmark_circle,size: 30,color: Colors.white,))
                  ],
                ),
                  const Gap(15),
                  SizedBox(
                      width: 400,
                      height: 80,
                      child: SignTextFieldWidget(
                          hint: "Email",
                          leading: const Icon(Icons.email),
                          controller: _password)),
                   SizedBox(
                      height: 55,
                      width: 400,
                      child: LogRegButton(text: "Parolni Jo'nating",onTap: (){},))
                ],
              ),
            ),
          );
        });
  }
}
