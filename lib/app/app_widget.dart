import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BarberShop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          backgroundColor: const Color(0xffFFFAEE),
          primaryColor: const Color(0xff883B35),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xff883B35),
          ),
          scaffoldBackgroundColor: const Color(0xffFFFAEE),
          textTheme: const TextTheme(
            bodyText1: TextStyle(
                fontSize: 15,
                color: Color(0xff883B35),
                fontWeight: FontWeight.w500),
            bodyText2: TextStyle(
                fontSize: 15,
                color: Color(0xff883B35),
                fontWeight: FontWeight.w500),
            headline1: TextStyle(
                fontSize: 24,
                color: Color(0xff883B35),
                fontWeight: FontWeight.bold),
            button: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          buttonTheme: const ButtonThemeData(buttonColor: Color(0xff883B35))),
    ).modular(); //added by extension
  }
}
