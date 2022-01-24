import 'package:barbershop/app/core/theme/theme_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chevron',
      debugShowCheckedModeBanner: false,
      theme: ThemeApp().use,
    ).modular(); //added by extension
  }
}
