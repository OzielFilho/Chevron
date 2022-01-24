import 'package:barbershop/app/modules/home/home_controller.dart';
import 'package:barbershop/app/core/utils/widgets/buttons/icon_with_text_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
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
              bottomNavigationBar: ClipPath(
                clipper: OvalTopBorderClipper(),
                child: Container(
                  height: 65,
                  color: Theme.of(context).primaryColor,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconWithTextCustom(
                        action: () {
                          setState(() {
                            controller.setIndex(0);
                          });
                        },
                        color: controller.getIndex() == 0
                            ? Colors.white
                            : Colors.grey[400],
                        icon: Icon(
                          Icons.home_outlined,
                          size: 30,
                          color: controller.getIndex() == 0
                              ? Colors.white
                              : Colors.grey[400],
                        ),
                        text: 'Home',
                      ),
                      IconWithTextCustom(
                        action: () {
                          setState(() {
                            controller.setIndex(1);
                          });
                        },
                        color: controller.getIndex() == 1
                            ? Colors.white
                            : Colors.grey[400],
                        icon: Icon(
                          Icons.schedule_outlined,
                          size: 30,
                          color: controller.getIndex() == 1
                              ? Colors.white
                              : Colors.grey[400],
                        ),
                        text: 'Agenda',
                      ),
                    ],
                  ),
                ),
              ),
              body: controller.pages[controller.getIndex()],
            )
          : Container(
              color: Theme.of(context).backgroundColor,
            );
    });
  }
}
