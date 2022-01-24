import 'package:barbershop/app/modules/home/home_controller.dart';
import 'package:barbershop/app/core/utils/widgets/buttons/text_buttom_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'options_drawer.dart';

class DrawerCustom extends StatefulWidget {
  const DrawerCustom({Key? key}) : super(key: key);

  @override
  _DrawerCustomState createState() => _DrawerCustomState();
}

class _DrawerCustomState extends State<DrawerCustom> {
  final controllerHome = Modular.get<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: controllerHome
                            .userFirebase!.photo!.isNotEmpty
                        ? NetworkImage(controllerHome.userFirebase!.photo!)
                        : const NetworkImage(
                            'https://user-images.githubusercontent.com/24848110/33519396-7e56363c-d79d-11e7-969b-09782f5ccbab.png'),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(controllerHome.userFirebase!.name),
                const OptionsDrawer(),
              ],
            ),
            TextButtomCustom(
                action: controllerHome.logoutFirebase,
                title: '- Sair',
                alignment: Alignment.centerLeft),
          ],
        ),
      ),
    );
  }
}
