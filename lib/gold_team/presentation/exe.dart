import 'package:flutter/material.dart';



class MyApp extends StatelessWidget {
  final List<List<String>> tableData = [
    ['Name', 'Age', 'Role'],
    ['John Doe', '30', 'Developer'],
    ['Jane Smith', '25', 'Designer'],
    ['Alex Johnson', '35', 'Manager'],
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Table Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Table Example'),
        ),
        body: Center(
          child: Table(
            border: TableBorder.all(),
            children: [
              _buildTableRow(tableData[0], isHeader: true),
              _buildTableRow(tableData[1]),
              _buildTableRow(tableData[2]),
              _buildTableRow(tableData[3]),
            ],
          ),
        ),
      ),
    );
  }

  TableRow _buildTableRow(List<String> rowData, {bool isHeader = false}) {
    return TableRow(
      children: rowData.map((cellData) {
        return TableCell(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              cellData,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}