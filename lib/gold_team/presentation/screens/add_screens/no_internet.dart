import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gold_team_investor_go/gold_team/constants/colors.dart';
import 'package:gold_team_investor_go/gold_team/constants/text_styles.dart';
import 'package:gold_team_investor_go/gold_team/presentation/widgets/workers/assets_getter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class NoInternet extends StatefulWidget {
  const NoInternet({super.key});

  @override
  State<NoInternet> createState() => _NoInternetState();
}

class _NoInternetState extends State<NoInternet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainTheme(context),
      body: _noInternet(),
    );
  }

  Widget _noInternet() {
    return Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                height: 225,
                width: 225,
                child: Lottie.asset("assets/lottie/lost_connection.json",
                    fit: BoxFit.cover)),
            Text("Internet Mavjud Emas",
                style: GoogleFonts.nunitoSans(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 19)),
            const Gap(15),
            Container(
              decoration:BoxDecoration(
                borderRadius: BorderRadius.circular(122),
                boxShadow: [
                  BoxShadow(color: Colors.black26,spreadRadius: 3,blurRadius: 3)
                ]
              ),
              child: SizedBox(
                height: 60,
                width: 60,
                child: ElevatedButton(onPressed: (){},child: Icon(CupertinoIcons.refresh,size: 25,color: Colors.black,),style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)
                ),
                backgroundColor: Colors.white
                            ),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
