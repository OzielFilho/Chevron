import 'package:barbershop/app/modules/home/home_controller.dart';
import 'package:barbershop/app/modules/home/initial_page/initial_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: InitialPage(),
    );
  }
}
