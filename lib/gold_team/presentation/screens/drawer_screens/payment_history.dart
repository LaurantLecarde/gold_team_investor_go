import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gold_team_investor_go/gold_team/constants/colors.dart';
import 'package:gold_team_investor_go/gold_team/constants/sizes_app.dart';
import 'package:gold_team_investor_go/gold_team/presentation/widgets/app_bar_app.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/text_styles.dart';

class PaymentHistory extends StatefulWidget {
  const PaymentHistory({super.key});

  @override
  State<PaymentHistory> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<PaymentHistory> {
  final List<Map<String, String>> data = [
    {'date': '09.02.2024 06:54:32', 'desc': 'click', 'amount': '10000'},
    {'date': '09.02.2024 06:54:32', 'desc': 'click', 'amount': '10000'},
    {'date': '09.02.2024 06:54:32', 'desc': 'click', 'amount': '10000'},
    {'date': '09.02.2024 06:54:32', 'desc': 'click', 'amount': '10000'},
    {'date': '09.02.2024 06:54:32', 'desc': 'click', 'amount': '10000'},
    {'date': '09.02.2024 06:54:32', 'desc': 'click', 'amount': '10000'},
    {'date': '09.02.2024 06:54:32', 'desc': 'click', 'amount': '10000'},
    {'date': '09.02.2024 06:54:32', 'desc': 'click', 'amount': '10000'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainTheme(context),
      appBar: AppBarApp(title: "TO'LOV TARIXI"),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: myDecoration,
              child: DataTable(
                columns: [
                  DataColumn(
                      label: Text(
                    'Sana',
                    style: titleStyle,
                  )),
                  DataColumn(
                      label: Text(
                    'Izoh',
                    style: titleStyle,
                  )),
                  DataColumn(
                      label: Text(
                    'Miqdor',
                    style: titleStyle,
                  )),
                ],
                rows: List.generate(
                  data.length,
                  (index) => DataRow(
                    cells: [
                      DataCell(Row(
                        children: [
                          Text(
                            "${index + 1})  ",
                            style: titleStyleSub,
                          ),
                          Text(
                            "${data[index]['date']!} ",
                            style: titleStyleSub,
                          ),
                        ],
                      )),
                      DataCell(Text(
                        "${data[index]['desc']!} yordamida balans to`ldirish",
                        style: subTitleStyle,
                      )),
                      DataCell(Text(
                        "${data[index]['amount']!} So'm",
                        style: subTitleStyle,
                      )),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(color: Colors.black12, spreadRadius: 5, blurRadius: 5)
          ], gradient: myGradientC(), borderRadius: BorderRadius.circular(15)),
          child: Center(
              child: Text(
            "Jami : ${calculateTotalAmount(data)} So'm",
            style: titleStyleBot,
          )),
        ),
      ),
    );
  }

  int calculateTotalAmount(List<Map<String, String>> data) {
    int total = 0;
    for (var item in data) {
      total += int.tryParse(item['amount'] ?? '0') ?? 0;
    }
    return total;
  }
}
