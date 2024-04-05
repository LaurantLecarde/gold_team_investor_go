import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gold_team_investor_go/gold_team/constants/colors.dart';
import 'package:gold_team_investor_go/gold_team/constants/navigators.dart';
import 'package:gold_team_investor_go/gold_team/constants/sizes_app.dart';
import 'package:gold_team_investor_go/gold_team/presentation/widgets/glow_button_toggle.dart';
import 'package:gold_team_investor_go/gold_team/presentation/widgets/leading_icon.dart';
import 'package:gold_team_investor_go/gold_team/presentation/widgets/sign_password_text_field.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  TextEditingController _payment = TextEditingController();

  final _boxDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(15),
    border: Border.all(color: Colors.black38, width: 3),
  );

  double _paymeOp = 1.0;
  double _clickOp = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainTheme(context),
      appBar: GradientAppBar(
        title: Text('HISOBNI TO`LDIRISH',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20)),
        gradient: LinearGradient(
          colors: [
            Color(0xff1d2b62),
            Color(0xff4f315f)
          ], // Your custom gradient colors
          begin: Alignment.centerLeft,
          end: Alignment.bottomRight,
        ),
      ),
      body: _paymentSection(),
    );
  }

  _paymentSection() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(20),
          Text("To'lov Qilmoqchi Bo'lgan Miqdoringizni Tanlang",
              style: GoogleFonts.nunitoSans(fontSize: 20)),
          const Gap(20),
          _paySection(),
          const Gap(30),
          Text("To'lov Usulini Tanlang",
              textAlign: TextAlign.start,
              style: GoogleFonts.nunitoSans(fontSize: 20)),
          const Gap(30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _paymentBuilderPayMe("assets/images/payme.png"),
              _paymentBuilderClick("assets/images/click.png"),
            ],
          ),
          const Gap(20),
          SizedBox(
              height: 60,
              width: double.infinity,
              child: LogRegButton(text: "Hisobimni To'ldirish", onTap: (){}))
        ],
      ),
    );
  }

  _paymentBuilderPayMe(String img) {
    return InkWell(
      onTap: () {
        setState(() {
          _paymeOp == 0.0 ? _paymeOp = 1.0 : _paymeOp = 0.0;
          _paymeOp == 0.0 ? _clickOp = 1.0 : _clickOp = 0.0;
        });
      },
      child: Container(
        height: 100,
        width: size(context).width / 3,
        child: Stack(children: [
          Center(
            child: Container(
              width: 300,
              decoration: _paymeOp == 1.0 ? BoxDecoration() : _boxDecoration,
              child: Image.asset(img, fit: BoxFit.cover),
            ),
          ),
          Center(
            child: AnimatedOpacity(
                duration: const Duration(seconds: 1),
                opacity: _paymeOp,
                child: _imageContainer("assets/icons/check.png")),
          ),
        ]),
      ),
    );
  }

  _paymentBuilderClick(String img) {
    return InkWell(
      onTap: () {
        setState(() {
          _clickOp == 0.0 ? _clickOp = 1.0 : _clickOp = 0.0;
          _clickOp == 0.0 ? _paymeOp = 1.0 : _paymeOp = 0.0;
        });
      },
      child: Container(
        height: 100,
        width: size(context).width / 3,
        child: Stack(children: [
          Center(
            child: Container(
              width: 300,
              height: 75,
              decoration: _clickOp == 1.0 ? BoxDecoration() : _boxDecoration,
              child: Image.asset(img, fit: BoxFit.cover),
            ),
          ),
          Center(
            child: AnimatedOpacity(
                duration: const Duration(seconds: 1),
                opacity: _clickOp,
                child: _imageContainer("assets/icons/check.png")),
          ),
        ]),
      ),
    );
  }

  _imageContainer(String img) {
    return Container(
        height: 75,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.blueAccent,
            width: 5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: 20,
                width: 20,
                child: Image.asset(
                  img,
                  color: Colors.blueAccent,
                  fit: BoxFit.cover,
                ))
          ],
        ));
  }

  _paySection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 70,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black38, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Gap(10),
              SizedBox(
                height: 55,
                width: 200,
                child: TextField(
                  style: GoogleFonts.nunitoSans(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Summani Kiriting",
                      hintStyle: GoogleFonts.nunitoSans()),
                ),
              ),
              Container(
                height: double.infinity,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Text("So'm",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold))),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class GradientAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height = 110;
  final Widget title;
  final LinearGradient gradient;

  GradientAppBar({required this.title, required this.gradient});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      height: height,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [LeadingIcon(), const Gap(40), title]),
      ),
      decoration: BoxDecoration(
        gradient: gradient,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 1),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}