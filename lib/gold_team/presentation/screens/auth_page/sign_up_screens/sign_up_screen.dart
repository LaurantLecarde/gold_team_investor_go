import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:gap/gap.dart';
import 'package:gold_team_investor_go/gold_team/constants/colors.dart';
import 'package:gold_team_investor_go/gold_team/presentation/screens/auth_page/sign_up_screens/privacy_policy.dart';
import 'package:gold_team_investor_go/gold_team/presentation/screens/main_page.dart';
import 'package:gold_team_investor_go/gold_team/presentation/widgets/glow_button_toggle.dart';
import 'package:gold_team_investor_go/gold_team/constants/navigators.dart';
import 'package:gold_team_investor_go/gold_team/presentation/widgets/phone_textfield.dart';
import 'package:gold_team_investor_go/gold_team/presentation/widgets/sign_password_text_field.dart';
import 'package:gold_team_investor_go/gold_team/presentation/widgets/sign_text_field.dart';
import 'package:gold_team_investor_go/gold_team/presentation/widgets/workers/snackbar_mine.dart';

import '../../../../exe_directory/exe_users.dart';
import 'about_company.dart';

class SignUp extends StatefulWidget {
  final VoidCallback onFlip;

  SignUp({Key? key, required this.onFlip}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _username = TextEditingController();

  final TextEditingController _email = TextEditingController();

  final TextEditingController _phone = TextEditingController();

  final TextEditingController _password = TextEditingController();

  final TextEditingController _confirmPassword = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final maskFormatter = MaskTextInputFormatter(mask: "+998 (##)-###-##-##");

  final maskFormatterSimple =
      MaskTextInputFormatter(mask: "#####################################");

  bool passIcon = true;

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
                  _buildTitleText("Xush Kelibsiz!"),
                  const Gap(10),
                  _buildSubtitleText(
                      "Ilovani Ishga Tushurishdan Oldin Registratsiyadan O'ting"),
                  const Gap(20),
                  _buildUsernameField(),
                  _buildEmailField(),
                  _buildPhoneField(),
                  _buildPasswordField(),
                  _buildConfirmPasswordField(),
                  const Gap(30),
                  _buildAccountExistsText(),
                  const Gap(10),
                  _buildAboutCompanyButton(context),
                  const Gap(15),
                  _buildRegisterButton(context),
                  const Gap(15),
                  _buildTermsText(context),
                  const Gap(30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitleText(String text) {
    return Text(
      text,
      style: GoogleFonts.nunitoSans(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  Widget _buildSubtitleText(String text) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: GoogleFonts.nunitoSans(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  Widget _buildUsernameField() {
    return SignTextFieldWidget(
      number: false,
      hint: "Username",
      leading: const Icon(Icons.person_rounded),
      controller: _username,
      section: 'Username',
    );
  }

  Widget _buildEmailField() {
    return SignTextFieldWidget(
      number: false,
      hint: "Email",
      controller: _email,
      leading: const Icon(Icons.email),
      section: 'Email',
    );
  }

  Widget _buildPhoneField() {
    return PhoneTextField(
      maskInputFormatters: maskFormatter,
      number: true,
      hint: "Telefon Raqam",
      leading: const Icon(Icons.phone),
      controller: _phone,
      section: 'Telefon Raqam',
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

  Widget _buildConfirmPasswordField() {
    return PasswordTextFieldWidget(
      number: false,
      close: passIcon,
      hint: "Parolni Tasdiqlang",
      leading: const Icon(Icons.lock),
      controller: _confirmPassword,
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
      section: 'Parolni Tasdiqlash',
    );
  }

  Widget _buildAccountExistsText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Akkauntingiz bormi ?   ",
          style: GoogleFonts.nunitoSans(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        InkWell(
          onTap: widget.onFlip,
          child: Text(
            "Login",
            style: GoogleFonts.nunitoSans(
              color: Colors.indigoAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAboutCompanyButton(BuildContext context) {
    return InkWell(
      onTap: () => navPush(context, AboutCompany()),
      child: Text(
        "Kompaniya Haqida",
        style: GoogleFonts.nunitoSans(
          fontSize: 14,
          color: Colors.indigoAccent,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildRegisterButton(BuildContext context) {
    return SizedBox(
      height: 55,
      width: double.infinity,
      child: LogRegButton(
        onTap: () {
          _validateRegistration(context);
        },
        text: "Register",
      ),
    );
  }

  Widget _buildTermsText(BuildContext context) {
    return Column(
      children: [
        const Gap(15),
        Text(
          "Registratsiya Qilish Orqali Siz ",
          style: GoogleFonts.nunitoSans(
            fontSize: 12,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        InkWell(
          onTap: () => navPush(context, PrivacyPolicy()),
          child: Text(
            "Ommaviy Offertaga",
            style: GoogleFonts.nunitoSans(
              fontSize: 14,
              color: Colors.indigoAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          "Rozi Bo'lasiz",
          style: GoogleFonts.nunitoSans(
            fontSize: 12,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  void _validateRegistration(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      if (_password.text != _confirmPassword.text) {
        showMineSnackBar("Parollar Mos Kelmayapti", Colors.red, context);
      } else if (_findUserEmail(_email.text)) {
        showMineSnackBar(
            "Bu Email Bilan Foydalanuvchi Mavjud", Colors.red, context);
      } else if (registerUser(int.parse(maskFormatter.getUnmaskedText()))) {
        showMineSnackBar(
            "Bu Telefon Raqam Bilan Foydalanuvchi Mavjud", Colors.red, context);
      } else {
        showMineSnackBar(
            "Muvaffaqiyatli Registratsiya Qilindi", Colors.green, context);
        navPushAndRemoveSmallToFull(context, MainPage());
      }
    }
  }

  bool _findUserEmail(String userEmail) {
    return exeUserList.any((user) => user.email == userEmail);
  }

  bool isPhoneNumberExists(int phoneNumber) {
    return exeUserList.any((user) => user.phoneNumber == phoneNumber);
  }

  bool registerUser(int phoneNumber) {
    return isPhoneNumberExists(phoneNumber);
  }
}
