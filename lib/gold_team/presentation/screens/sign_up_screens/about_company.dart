import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/navigators.dart';
import '../../widgets/glow_button_toggle.dart';

class AboutCompany extends StatefulWidget {
  const AboutCompany({super.key});

  @override
  State<AboutCompany> createState() => _AboutCompanyState();
}

class _AboutCompanyState extends State<AboutCompany> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.green,
        title: Text(
          "Kompaniya Haqida",
          style: GoogleFonts.nunitoSans(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: _aboutCompany(),
    );
  }

  _aboutCompany() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _imageSection(),
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _titleSize(
                    "ZAMONAVIY DUNYO ORZUNI HAQIQATGA AYLANTIRISHNI BILADIGAN MUVAFFAQIYATLI VA MAQSADLI ODAMLARGA MUHTOJ.",
                    context),
                _subTitleSize(
                    "Buning uchun zarur bo'lgan narsa - o'z potentsialingizdan to'g'ri foydalanish, ustuvorliklarni belgilash va ijobiy natija uchun barcha sa'y-harakatlaringizni amalga oshirishdir.",
                    context),
                _subTitleSize(
                    "Har bir inson o'z baxtining me'moridir, shunday emasmi? Keling, ushbu bayonotning haqiqatini birgalikda ko'rib chiqaylik.",
                    context),
                _subTitleSize(
                    "Axir, har kim o'z hayotini o'zgartirishi mumkin. Sayohat va qimmatbaho xaridlar orzulari orzu bo'lib qolmasligi kerak.",
                    context),
                _subTitleSize(
                    "Gold Team Investor bilan moliyaviy noqulayliklarni unutib, orzularingizni ro'yobga chiqarishingiz mumkin.",
                    context),
                _subTitleSize(
                    "Sizga kerak bo'lgan hamma narsani sotib olish, kreditlar va qarzlarni to'lash, shuningdek, to'liq moliyaviy mustaqillik muvaffaqiyatli va dabdabali hayotingiz uchun asos bo'ladi.",
                    context),
                InteractiveViewer(
                    maxScale: 4.0,
                    minScale: 0.5,
                    child: Image.asset("assets/images/licence.png")),
                _titleSize("Bizning rekvizitlar", context),
                _titleSize("“Gold Team Investor” MCHJ", context),
                _subTitleSize("Yuridik manzil: O’zbekiston, Andijon viloyati, Paxtaobod tumani, Mustaqillik MFY, Nurafshon k., 5-uy", 
                    context),
                _subTitleSize("STIR: 311047909", context),
                Divider(thickness: 2, color: Colors.grey),
                const Gap(20),
                Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: SizedBox(
                      width: 150,
                      height: 55,
                      child: LogRegButton(
                        text: "Tushunarli",
                        onTap: () => navPop(context),
                      )),
                ),
                const Gap(30),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _imageSection() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
        // color: Colors.black
      ),
      height: 200,
      width: double.infinity,
      child: Image.asset(
        "assets/images/about_company.png",
        fit: BoxFit.cover,
      ),
    );
  }

  _titleSize(String title, context) {
    final titleTextStyle =
        GoogleFonts.nunitoSans(fontWeight: FontWeight.bold, fontSize: 23);
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: SizedBox(
          width: MediaQuery.of(context).size.width / 1.1,
          child:
              Text(textAlign: TextAlign.center, title, style: titleTextStyle)),
    );
  }

  _subTitleSize(String subTitle, context) {
    final subTitleTextStyle = GoogleFonts.nunitoSans(fontSize: 18);
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: SizedBox(
          width: MediaQuery.of(context).size.width / 1.1,
          child: Text(subTitle, style: subTitleTextStyle)),
    );
  }

// _licence(){
//   return   }
}
