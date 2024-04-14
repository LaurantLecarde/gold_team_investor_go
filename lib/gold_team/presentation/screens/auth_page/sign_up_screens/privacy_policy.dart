import 'package:flutter/material.dart';
import 'package:gold_team_investor_go/gold_team/presentation/widgets/glow_button_toggle.dart';
import 'package:gold_team_investor_go/gold_team/constants/navigators.dart';
import 'package:google_fonts/google_fonts.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.green,
        title: Text(
          "Ommaviy Offerta",
          style: GoogleFonts.nunitoSans(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: _privacy(context),
    );
  }

  Widget _privacy(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _title(
            "“ GOLD TEAM INVESTOR ” MCHJ sayti orqali mahsulotlar, tovarlar sotish va xizmat ko‘rsatish bo‘yicha",
            context,
          ),
          _title("Sotuvchi", context),
          _subtitle(
            "“GOLD TEAM INVESTOR” MCHJ (masʼuliyati cheklangan jamiyati), manzil: Andijon viloyati, paxtaobod tumani, mustaqillik MFY, Nurafshon ko‘chasi, mazkur korxona tinglovchilarning buyurtmasi asosida masofadan, yaʼni internet orqali xizmatlar ko‘rsatuvchi.",
            context,
          ),
          _title("Xaridor", context),
          _subtitle("Jismoniy va yuridik shaxslar.", context),
          _title("Offerta", context),
          _subtitle(
            "Sotuvchining nomuayyan shaxslar doirasiga chakana savdo-sotiq qilish yo‘li bilan internet orqali masofadan turib xizmatni sotib olish bo‘yicha sotuvchining shartlari doirasida shartnoma tuzishga yo‘llangan taklifdir.",
            context,
          ),
          _title("Aksept", context),
          _subtitle(
            "Xaridor tomonidan ofertani to‘liq va shartlarsiz qabul qilish va shartnomani tuzilgan deb hisoblash.",
            context,
          ),
          _title("Shartnoma", context),
          _subtitle(
            "(Matnda – shartnoma) – internet orqali masofadan turib xizmatni sotib olish bo‘yicha sotuvchining shartlari bilan xaridorning tanishishi va roziligi asosida hamda belgilangan katalog yoki ro‘yhat doirasida taklif etilayotgan xizmatni sotib olish bo‘yicha kelishuv.",
            context,
          ),
          _title("Buyurtma", context),
          _subtitle(
            "Elektron hujjat, unda xaridorni tanlagan xizmat turi, uning narxi (belgilangan hollarda esa tanlangan bonus(lar), xizmatni va/yoki uning natijasini eltib berish maqsadida talab etiladigan xaridorga tegishli maʼlumotlar: FISH yoki nomi, (elektron) manzil, qayta aloqaga kirishish uchun telefon raqami yoki elektron manzili (kontakt) va saytning tegishli shaklida belgilangan boshqa maʼlumotlar bo‘lishi talab etiladi. Buyurtmani to‘ldirish jarayonida xaridor pulni to‘lov usuli, to‘lov kodi, yetkazib berish xarajatlari haqida to‘liq maʼlumotni oladi.",
            context,
          ),
          _title("Xizmat(lar)", context),
          _subtitle(
            "Internet orqali masofadan turib ko‘rsatiladigan, xaridorning buyurtmasi asosida tanlangan, belgilangan kontakt maʼlumotlar bo‘yicha yetkazib berilishi ko‘zda tutilgan xizmatlar. Ularga masofaviy taʼlim, mahsulotlar, tovarlar",
            context,
          ),
          _title("Umumiy shartlar", context),
          _subtitle(
            "1.1. Ushbu shartnoma hamda saytdagi taklif etilayotgan xizmatlar ommaviy oferta hisoblanadi.",
            context,
          ),
          _subtitle(
            "1.2. Xaridor saytda buyurtmani shakllantirishda mazkur shartnoma shartlariga rozi va ularni to‘liq qabul qilishini bildiradi.",
            context,
          ),
          _subtitle(
            "1.3. Xizmatlarni sotish hududi – O‘zbekiston Respublikasi hududi hamda dunyo miqyosida sotish hisoblanadi.",
            context,
          ),
          _subtitle(
            "1.4. Sotuvchi shartnoma shartlariga har qanday vaqtda o‘z tomonidan o‘zgartirish kiritish huquqiga ega.",
            context,
          ),
          _subtitle(
            "1.5. Sotuvchi xizmatlarni sotish jarayoniga xaridorning roziligisiz uchinchi tomonni jalb etish huquqiga ega.",
            context,
          ),
          _subtitle(
            "1.6. Xizmatdan foydalanish jarayonida xizmat yuzasidan qo‘shimcha savolga, maslahatga ehtiyoj paydo bo‘lganda xaridor birinchi bo‘lib Liderig murojaat qilishi lozim.",
            context,
          ),
          _title("2. Buyurtmani shakllantirish tartibi", context),
          _subtitle(
            "2.1. Xizmat(lar)ni sotib olish niyatida xaridor saytda ko‘rsatilgan shaklni – Buyurtmani rasmiylashtiradi. Birinchi marta buyurtmani rasmiylashtirayotgan xaridor «Saytda ro‘yhatdan o‘tish» jarayonidan o‘tadi, keyingi holatlarda «Avtorizatsiyadan o‘tish» jarayonidan o‘tadi.",
            context,
          ),
          _subtitle(
            "2.2. Ro‘yhatdan o‘tish – xizmatlar natijalarini va/yoki moddiy eltmalarni xaridorga yetkazishni amalga oshirish uchun zarur bo‘lgan maʼlumotlarni Saytda keltirilgan shakl – “Mening sozlashlarim” shaklidagi ko‘rsatilgan forma asosida Xaridor tomonidan to‘ldirilishidir. Ro‘yxatdan o‘tish Xaridor uchun shaxsiy kabinet ochish imkoniyatini beradi. “Mening sozlashlarim” shaklidagi barcha maʼlumotlarni Xaridor o‘z shaxsiy kabinetiga kirgandan so‘ng mustaqil o‘zgartirishi mumkin.",
            context,
          ),
          _subtitle(
            "2.3. Faqat ro‘yhatdan o‘tgandan so‘ng yoki Avtorizatsiyadan o‘tgandan so‘ng buyurtma uchun to‘lovni amalga oshirish imkoniyati paydo bo‘ladi. “Mening sozlashlarim” shaklida ko‘rsatilishi majburiy bo‘lgan maʼlumotlar majmui mavjud. Bunday maʼlumotlarni to‘ldirmaslik buyurtmani rasmiylashtirish imkonini chegaralab qo‘yadi yoki bermaydi.",
            context,
          ),
          _subtitle(
            "2.4. Buyurtmani shakllantirish jarayoni “To‘lash” tugmasini bosish bilan yakunlanadi. Ushbu tugmani bosish chakana savdo-sotiq bo‘yicha shartnoma tuzilganligini tasdiqlovchi Aksept hisoblanadi. Ushbu holatdan so‘ng xaridor 5 (besh) kalendar kuni ichida buyurtmaning to‘lovini amalga oshiradi. To‘lov amalga oshirilgan vaqtdan boshlab zudlik bilan yoki uzog‘i bilan 72 soat ichida Sotuvchi tomonidan yoki mobil telefon aloqasi orqali SMS-xabar, yoki elektron pochta orqali (qaysi bir aloqaning taqdim etilgani, qulayligi, tezligiga qarab) to‘lovni qabul qilingani to‘g‘risida Operator tasdig‘ini oladi.",
            context,
          ),
          _subtitle(
            "2.5. Buyurtmani rasmiylashtirishda (shakllarni to‘ldirishda) taqdim etilgan maʼlumotlarni to‘g‘riligi va ishonchliligiga xaridor to‘liq javobgarlikni o‘z zimmasiga oladi.",
            context,
          ),
          _subtitle(
            "2.6. Xizmat natijalarini taqdim etish xaridor tomonidan to‘lovni to‘liq amalga oshirgandan so‘ng sotuvchi tomonidan amalga oshiriladi.",
            context,
          ),
          _title("3. To‘lovni amalga oshirish", context),
          _subtitle(
            "3.1. To‘lanishi zarur bo‘lgan summa buyurtmani rasmiylashtirishda xaridorga taqdim etiladi.",
            context,
          ),
          _title("4. Javobgarlik", context),
          _subtitle(
            "4.1. Shartnoma shartlari asosan elektron dasturiy taʼminot tomonidan amalga oshirilayotgani va xizmat masofadan internet orqali amalga oshirilayotgani, shu jumladan xaridorga nomoddiy mulk taklif etilayotganini eʼtiborga olib,",
            context,
          ),
          _subtitle(
            "4.2. Sotuvchining xaridor oldidagi mulkiy javobgarligi hajmi buyurtmaning bahosi (summasi)dan oshmasligini tomonlar tushunadilar va qo‘llaydilar.",
            context,
          ),
          _subtitle(
            "4.3. Xaridorlar saytda buyurtmani rasmiylashtirayotib ko‘rsatilgan xizmat uchun to‘langan pul summasini qaytarilishini daʼvo qila olmasliklarini tushunadilar va qo‘llaydilar.",
            context,
          ),
          _subtitle(
            "4.4. Xaridor saytdan olgan xizmat va uning natijalarini (GOLD TEAM INVESTOR saytidan sotib olgan onlayn kurslarni, dars mavzularini, onlayn kursda ochib berilgan shaxsiy hisobini), bonuslar va boshqa moddiy va nomoddiy mulkiy huquqlarni tijorat maqsadlarida ishlatmasligi, sotuvchining yozma roziligini oldindan olmay turib uchinchi shaxslarga foydalanish uchun tarqatmaslik.",
            context,
          ),
          _title("5. Shartnomaga o‘zgartirish va qo‘shimchalar kiritish", context),
          _subtitle(
            "5.1. Sotuvchi bir tomonlama mazkur shartnoma shartlarini hamda saytda chop etilgan barcha hujjatlarni o‘zgartirish huquqiga ega. Sotuvchi xaridorni bunday o‘zgarishlar haqida xabar bilan taʼminlash majburiyatini o‘z zimmasiga olmaydi. Amalga oshirilgan barcha o‘zgartirishlar saytda chop etilgan vaqtdan boshlab xaridor uchun shartli hisoblanadi. Bunday o‘zgartirishlar xaridor tomonidan qabul qilinmasa, sotuvchini xabardor qilgan holda xaridor buyurtmani bekor qilish huquqiga ega.",
            context,
          ),
          _title("6. Maʼlumotlarni saqlanishi", context),
          _subtitle(
            "6.1. Sotuvchi xaridor tomonidan taqdim etilgan shaxsiy maʼlumotlarni qonunchilikda belgilangan tartibda va darajada himoyada bo‘lishi va sir saqlanishiga javobgar.",
            context,
          ),
          _title(
              "PULLIK MARKETING HIZMATLARINI KORSATISH UCHUN SHARTNOMA TUZISH TARTIBI",
              context),
          _subtitle(
            "7.1. “GOLD TEAM  INVESTOR” sayti barcha harlar savdo-sotiq ishlarini olib boradi. Savdo mavjud yangi azosi faqat tizimda faoliyat olib boradi faol hamkor tavsiyasiga asosan ro’yhatdan o’tkazgan mustakil hamkor b’ladi",
            context,
          ),
          _subtitle(
            "7.2   sotib olish uchun qilingan tulovga savdo tizimi sayti shahsiy hisobni yuritish, savdo tijorat aksiyalarda ishtirok etish, treninglar, “GOLD TEAM INVESTOR ” savdo tizimi sovg`alari, reklamalari va tashkiliy faoliyatdan daromad olishgayordam beradi. Savdo xizmati saytida joylashtirilgan Nizomning marketing rejasiga muvofiq hamkorlik faoliyatiga sodiqlik",
            context,
          ),
          _subtitle(
            "7.3  Savdo tisining marketing rejasiga muvofiq, IT kurslari to’plamini harid kilgan hamkor platforming birinchi boskichidan joy egallaydi. Va o`z savdo tizimini shakillantirishni boshlaydi.",
            context,
          ),
          _subtitle(
            "7.4 Mahsulotlarni sotib olish va marketing, IT kurslarini pullik taqdim etish (ommaviy offerta) mijozga mahsulot sotib olayotganda avtomatik ravishda e-mail orqali yuboriladi. shuningdek saytning «hujatlar» bulimida shahsiy kabinetida chop etishi mumkin",
            context,
          ),
          _title("8. TOMONLARNING HUQUQ VA MAJBURIYATLARI", context),
          _subtitle(
            "8.1. Savdo a’zolari har bir mustaqil hamkori va “GOLD TEAM INVESTOR ” onlayn savdo tizimining o’zi halolik va ochiqlik tamoyillariga rioya qilish majburiy.",
            context,
          ),
          _subtitle(
            "8.2 “GOLD TEAM INVESTOR ” onlayn savdo tizining maxsuloti va marketing rejasini mahsulot darajada tushuntirish.",
            context,
          ),
          _title("9. NIZOLARNI HAL QILISH TARTIBI", context),
          _subtitle(
            "9.1 “GOLD TEAM INVESTOR ” onlayn savdo taqdimotida elon qilingan shartlar va qoidalari o’zgarmasligini ta’minlash, onlayn savdo qilish maxsulotlari va hizmatlarining narxini oshirmaslik va kamaytirmaslik.",
            context,
          ),
          _subtitle(
            "9.2. Shartnoma shartlarini bajarish bilan bog`liq har qanday nizolar yoki kelishmovchiliklar kelganda, hujjatlar o’z shaxsiy muzokaralar orqali hal qilish uchun say-harakatlarni amalga oshiradilar",
            context,
          ),
          _subtitle("9.3 MAHSULOTNING QAYTARILISHI.", context),
          _subtitle(
            "9.4. O’zbekiston Republikasi qonunchiligiga ko’ra sotilgan mahsulotlar qaytarib olinmaydi.",
            context,
          ),
          const Divider(thickness: 2, color: Colors.grey),
          const Padding(padding: EdgeInsets.all(20)),
          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: SizedBox(
                width: 150,
                height: 55,
                child: LogRegButton(
                  text: "Tanishdim",
                  onTap: () => navPop(context),
                )),
          ),
          const Padding(padding: EdgeInsets.all(30)),
        ],
      ),
    );
  }

  Widget _title(String title, BuildContext context) {
    final titleTextStyle =
    GoogleFonts.nunitoSans(fontWeight: FontWeight.bold, fontSize: 23);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 1.1,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: titleTextStyle,
        ),
      ),
    );
  }

  Widget _subtitle(String subTitle, BuildContext context) {
    final subTitleTextStyle = GoogleFonts.nunitoSans(fontSize: 18);
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 1.1,
        child: Text(
          subTitle,
          style: subTitleTextStyle,
        ),
      ),
    );
  }
}
