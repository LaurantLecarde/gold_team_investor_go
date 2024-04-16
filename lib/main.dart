import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:gold_team_investor_go/gold_team/exe_directory/exe.dart';
import 'package:gold_team_investor_go/gold_team/model/conntectivity_class.dart';
import 'package:gold_team_investor_go/gold_team/presentation/screens/add_screens/no_internet.dart';
import 'package:gold_team_investor_go/gold_team/presentation/screens/main_page.dart';
import 'package:provider/provider.dart';

import 'gold_team/presentation/screens/auth_page/flip_log_reg.dart';
import 'gold_team/presentation/screens/auth_page/sign_in_screens/sign_in.dart';

void main() {
  runApp(GoldenInvest());
}

// void main(){
//   runApp(MyApp());
// }

class GoldenInvest extends StatelessWidget {
  GoldenInvest({super.key});

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<ConnectivityService>(
              create: (_) => ConnectivityService()),
        ],
        child: MaterialApp(
          theme: ThemeData(useMaterial3: true, primaryColor: Color(0xffe6e9ef)),
          debugShowCheckedModeBanner: false,
          // home: MainPage(),
          home: AnimatedSplashScreen(
            duration: 1250,
            backgroundColor: Colors.black,
            splash: SizedBox(
                height: 80,
                width: 120,
                child: Image.asset(
                    "assets/logo/gold_team.png", fit: BoxFit.cover)),
            nextScreen: LoginRegisterFlip(),
            splashTransition: SplashTransition.fadeTransition,
          ),
        ));
  }
}
