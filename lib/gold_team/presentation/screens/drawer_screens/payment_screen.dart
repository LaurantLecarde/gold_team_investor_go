import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gold_team_investor_go/gold_team/constants/colors.dart';
import 'package:gold_team_investor_go/gold_team/constants/navigators.dart';
import 'package:gold_team_investor_go/gold_team/constants/sizes_app.dart';
import 'package:gold_team_investor_go/gold_team/presentation/widgets/app_bar_app.dart';
import 'package:gold_team_investor_go/gold_team/presentation/widgets/glow_button_toggle.dart';
import 'package:gold_team_investor_go/gold_team/presentation/widgets/leading_icon.dart';
import 'package:gold_team_investor_go/gold_team/presentation/widgets/sign_password_text_field.dart';
import 'package:gold_team_investor_go/gold_team/presentation/widgets/workers/loading_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

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

  late String clickImage;
  late String paymeImage;

  @override
  void initState() {
    clickImage = "assets/images/click.png";
    paymeImage = "assets/images/payme.png";
    super.initState();
  }

  // var maskFormatter = new MaskTextInputFormatter(
  //     mask: '# ### ### ### ### ###',
  //     type: MaskAutoCompletionType.lazy
  // );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainTheme(context),
      appBar: AppBarApp(
        title: 'HISOBNI TO`LDIRISH',
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
              _paymentBuilderPayMe(paymeImage),
              _paymentBuilderClick(clickImage),
            ],
          ),
          const Gap(20),
          SizedBox(
              height: 60,
              width: double.infinity,
              child: LogRegButton(text: "Hisobimni To'ldirish", onTap: () {}))
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
            child: FutureBuilder(
              future: _delayedCheckImage(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(
                      width: 300,
                      height: 75,
                      padding: EdgeInsets.all(8),
                      decoration: _boxDecoration,
                      child: LoadingWidget()); // Placeholder for loading
                } else {
                  return Container(
                    width: 300,
                    height: 75,
                    decoration:
                        _paymeOp == 1.0 ? BoxDecoration() : _boxDecoration,
                    child: Image.asset(img, fit: BoxFit.cover),
                  );
                }
              },
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
            child: FutureBuilder(
              future: _delayedCheckImage(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(
                      width: 300,
                      height: 75,
                      padding: EdgeInsets.all(8),
                      decoration: _boxDecoration,
                      child: LoadingWidget()); // Placeholder for loading
                } else {
                  return Container(
                    width: 300,
                    height: 75,
                    decoration:
                        _clickOp == 1.0 ? BoxDecoration() : _boxDecoration,
                    child: Image.asset(img, fit: BoxFit.cover),
                  );
                }
              },
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

  Future<void> _delayedCheckImage() async {
    await Future.delayed(Duration(seconds: 1));
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

