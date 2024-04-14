import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/conntectivity_class.dart';

class InternetHaveNot extends StatefulWidget {
  const InternetHaveNot({super.key});

  @override
  State<InternetHaveNot> createState() => _InternetHaveNotState();
}

class _InternetHaveNotState extends State<InternetHaveNot> {
  @override
  Widget build(BuildContext context) {
    var connectivityService = Provider.of<ConnectivityService>(context);


    return Scaffold(
      body: Center(
        child: Text(
          connectivityService.isConnected
              ? 'Connected to Internet'
              : 'No Internet Connection',
        ),
      ),
    );
  }
}
