import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gold_team_investor_go/gold_team/constants/colors.dart';
import 'package:gold_team_investor_go/gold_team/presentation/screens/sign_in_screens/sign_in.dart';
import 'package:gold_team_investor_go/gold_team/presentation/screens/sign_up_screens/about_company.dart';
import 'package:gold_team_investor_go/gold_team/presentation/screens/sign_up_screens/privacy_policy.dart';
import 'package:gold_team_investor_go/gold_team/presentation/widgets/glow_button_toggle.dart';
import 'package:gold_team_investor_go/gold_team/constants/navigators.dart';
import 'package:gold_team_investor_go/gold_team/presentation/widgets/phone_textfield.dart';
import 'package:gold_team_investor_go/gold_team/presentation/widgets/sign_password_text_field.dart';
import 'package:gold_team_investor_go/gold_team/presentation/widgets/sign_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../widgets/workers/open_container.dart';

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

  double _opacity = 0.0;

  bool passIcon = true;
  bool confPassIcon = true;

  final _formKey = GlobalKey<FormState>();

  var maskFormatter = MaskTextInputFormatter(
    mask: "+998 ##-###-##-##"
  );

  var maskFormatterSimple = MaskTextInputFormatter(
      mask: "#####################################"
  );

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 1), () {
      setState(() {
        _opacity = 1.0;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _signUp(),
    );
  }

  _signUp() {
    return AnimatedOpacity(
      duration: const Duration(seconds: 3),
      opacity: _opacity,
      curve: Curves.easeInOut,
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(gradient: myGradientC()),
        child: Center(
          child: Form(
            key: _formKey,
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
                    number: false,
                      hint: "Username",
                      leading: const Icon(Icons.person_rounded),
                      controller: _username, section: 'Username',),
                  SignTextFieldWidget(
                    number: false,
                      hint: "Email",
                      controller: _email,
                      leading: const Icon(Icons.email),section: 'Email',),
                  PhoneTextField(
                    maskInputFormatters: maskFormatter,
                    number: true,
                      hint: "Telefon Raqam",
                      leading: const Icon(Icons.phone),
                      controller: _phone,section: 'Telefon Raqam',),
                  PasswordTextFieldWidget(
                    number: false,
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
                              ? CupertinoIcons.eye
                              : CupertinoIcons.eye_slash)), section: 'Parol',),
                  PasswordTextFieldWidget(
                    number: false,
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
                              ? CupertinoIcons.eye
                              : CupertinoIcons.eye_slash)), section: 'Parolni Tasdiqlash',),
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
                  const Gap(10),
                  InkWell(
                      onTap: () => navPush(context, AboutCompany()),
                      child: Text(" Kompaniya Haqida ",
                          style: GoogleFonts.nunitoSans(
                              fontSize: 14,
                              color: Colors.indigoAccent,
                              fontWeight: FontWeight.bold))),
                  const Gap(15),
                  SizedBox(
                    height: 55,
                    width: double.infinity,
                    child: LogRegButton(
                      text: "Register",
                      onTap: () {
                        if (_formKey.currentState!.validate()) {}
                      },
                    ),
                  ),
                  const Gap(15),
                  Text("Registratsiya Qilish Orqali Siz ",
                      style: GoogleFonts.nunitoSans(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  InkWell(
                      onTap: () => navPush(context, PrivacyPolicy()),
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
        ),
      ),
    );
  }
}
