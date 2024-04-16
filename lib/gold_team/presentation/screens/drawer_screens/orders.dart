import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gold_team_investor_go/gold_team/constants/colors.dart';
import 'package:gold_team_investor_go/gold_team/constants/sizes_app.dart';
import 'package:gold_team_investor_go/gold_team/presentation/screens/add_screens/no_internet.dart';
import 'package:gold_team_investor_go/gold_team/presentation/widgets/app_bar_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../constants/text_styles.dart';
import '../../../model/conntectivity_class.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  final List<Map<String, String>> data = [
    {'name': 'admin_1', 'cost': '300000', 'created_date': '25.02.2024'},
    {'name': 'admin_2', 'cost': '300000', 'created_date': '25.02.2024'},
    {'name': 'admin_3', 'cost': '300000', 'created_date': '25.02.2024'},
    {'name': 'admin_4', 'cost': '300000', 'created_date': '25.02.2024'},
    {'name': 'admin_5', 'cost': '300000', 'created_date': '25.02.2024'},
    {'name': 'admin_6', 'cost': '300000', 'created_date': '25.02.2024'},
    {'name': 'admin_7', 'cost': '300000', 'created_date': '25.02.2024'},
    {'name': 'admin_8', 'cost': '300000', 'created_date': '25.02.2024'},
  ];

  @override
  Widget build(BuildContext context) {
    var connectivityService = Provider.of<ConnectivityService>(context);

    return Scaffold(
      backgroundColor: mainTheme(context),
      appBar:AppBarApp(title: "BUYURTMALAR"),
      // body: connectivityService.isConnected ? _orderSection() : NoInternet(),
     body: _orderSection(),

      bottomNavigationBar:_bottomNav(),
    );
  }

  _bottomNav() {

    var connectivityService = Provider.of<ConnectivityService>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(color: Colors.black12, spreadRadius: 5, blurRadius: 5)
        ], gradient: myGradientC(), borderRadius: BorderRadius.circular(15)),
        child: Center(
            child: Text(
              connectivityService.isConnected ?
          "Jami : ${calculateTotalAmount(data)} So'm" : "Internet Mavjud Emas",
          style: titleStyleBot,
        )),
      ),
    );
  }

  _orderSection() {
    return SingleChildScrollView(
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
                  'Nomi',
                  style: titleStyle,
                )),
                DataColumn(
                    label: Text(
                  'Narxi',
                  style: titleStyle,
                )),
                DataColumn(
                    label: Text(
                  'Yaratilgan Sanasi',
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
                          "${data[index]['name']!} - Klon Xarid Qildi",
                          style: subTitleStyle,
                        ),
                      ],
                    )),
                    DataCell(Text(
                      "${data[index]['cost']!} So'm",
                      style: subTitleStyle,
                    )),
                    DataCell(Text(
                      data[index]['created_date']!,
                      style: subTitleStyle,
                    )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  int calculateTotalAmount(List<Map<String, String>> data) {
    int total = 0;
    for (var item in data) {
      total += int.tryParse(item['cost'] ?? '0') ?? 0;
    }
    return total;
  }
}
