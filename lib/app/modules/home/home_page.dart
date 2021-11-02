import 'package:barbershop/app/modules/home/home_controller.dart';
import 'package:barbershop/app/modules/home/initial_page/initial_page.dart';
import 'package:barbershop/app/modules/home/widgets/drawer_custom.dart';
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
          ? Scaffold(
              appBar: AppBar(
                title: Text('Bem Vindo, ${controller.userFirebase!.name}'),
              ),
              drawer: const SafeArea(child: DrawerCustom()),
              body: const InitialPage(),
            )
          : Container();
    });
  }
}
