import 'package:barbershop/app/modules/home/home_controller.dart';
import 'package:barbershop/app/modules/home/pages/initial_page/initial_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  initHome() async {
    await controller.getUserinFirestore();
  }

  @override
  void initState() {
    initHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return controller.userFirebase != null
          ? const Scaffold(
              body: InitialPage(),
            )
          : Container(
              color: Theme.of(context).backgroundColor,
            );
    });
  }
}
