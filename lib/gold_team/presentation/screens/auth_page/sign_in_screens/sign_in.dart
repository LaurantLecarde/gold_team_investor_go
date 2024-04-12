import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gold_team_investor_go/gold_team/presentation/widgets/glow_button_toggle.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:flip_card/flip_card.dart';
import 'package:gold_team_investor_go/gold_team/constants/colors.dart';
import 'package:gold_team_investor_go/gold_team/presentation/screens/main_page.dart';
import 'package:gold_team_investor_go/gold_team/presentation/widgets/sign_password_text_field.dart';
import 'package:gold_team_investor_go/gold_team/presentation/widgets/sign_text_field.dart';
import 'package:gold_team_investor_go/gold_team/presentation/widgets/workers/snackbar_mine.dart';

import '../../../../constants/navigators.dart';

class SignIn extends StatefulWidget {
  final VoidCallback onFlip;

  SignIn({Key? key, required this.onFlip}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _username = TextEditingController();

  final TextEditingController _password = TextEditingController();

  final TextEditingController _email = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  final String _userName = "Sardorbek";

  final String _passWord = "19831983";

  bool passIcon = true;

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    _email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _signUp(context),
    );
  }

  Widget _signUp(context) {
    return AnimatedOpacity(
      duration: const Duration(seconds: 3),
      opacity: 1.0,
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
                  _buildTitleText(
                      "Sizni Yana Ko'rib Turganimizdan Xursandmiz!",25),
                  const Gap(10),
                  _buildTitleText(
                      "Ilovani Ishga Tushurishdan Oldin Login Qiling",18),
                  const Gap(20),
                  _buildUsernameField(),
                  _buildPasswordField(),
                  const Gap(30),
                  _buildRegisterText(),
                  const Gap(30),
                  _buildLoginButton(context),
                  const Gap(15),
                  _buildForgotPasswordText(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitleText(String text,double fontSize) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: GoogleFonts.nunitoSans(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }


  Widget _buildUsernameField() {
    return SignTextFieldWidget(
      number: false,
      hint: "Username",
      controller: _username,
      leading: const Icon(Icons.person_rounded),
      section: 'Username',
    );
  }

  Widget _buildPasswordField() {
    return PasswordTextFieldWidget(
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
        icon: Icon(
          passIcon ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
        ),
      ),
      section: 'Parol',
    );
  }

  Widget _buildRegisterText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Hali Yangimisiz ?   ",
          style: GoogleFonts.nunitoSans(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        InkWell(
          onTap: widget.onFlip,
          child: Text(
            "Register",
            style: GoogleFonts.nunitoSans(
              color: Colors.indigoAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return SizedBox(
      height: 55,
      width: double.infinity,
      child: LogRegButton(
        text: 'Login',
        onTap: () =>_validateLogin(context),
      ),
    );
  }

  Widget _buildForgotPasswordText(BuildContext context) {
    return InkWell(
      onTap: () => _showPasswordDialog(context),
      child: Text(
        "Parol Esingizdan Chiqdimi ?",
        textAlign: TextAlign.center,
        style: GoogleFonts.nunitoSans(
          color: Colors.indigoAccent,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  void _validateLogin(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      if (_username.text == _userName && _password.text == _passWord) {
        navPushAndRemove(context, MainPage());
        showMineSnackBar("Muvaffaqiyatli Login", Colors.green, context);
      } else {
        showMineSnackBar(
            "Bunday Foydalanuvchi Mavjud Emas!", Colors.red, context);
      }
    }
  }

  void _showPasswordDialog(BuildContext context) {
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
              gradient: myGradientC(),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Parolni Bilish",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.nunitoSans(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        CupertinoIcons.xmark_circle,
                        size: 30,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                const Gap(15),
                SizedBox(
                  width: 400,
                  height: 80,
                  child: SignTextFieldWidget(
                    number: false,
                    hint: "Email",
                    leading: const Icon(Icons.email),
                    controller: _email,
                    section: 'Email',
                  ),
                ),
                SizedBox(
                  height: 55,
                  width: 400,
                  child: LogRegButton(
                    onTap: () => navPush(context, MainPage()),
                    text:"Parolni Jo'nating",
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
