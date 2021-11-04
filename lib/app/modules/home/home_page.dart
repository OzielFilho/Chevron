import 'package:barbershop/app/modules/home/home_controller.dart';
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
                  height: 60,
                  color: Theme.of(context).primaryColor,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              controller.setIndex(0);
                            });
                          },
                          icon: Icon(
                            Icons.home_outlined,
                            color: controller.getIndex() == 0
                                ? Colors.white
                                : Colors.grey[400],
                          )),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            controller.setIndex(1);
                          });
                        },
                        icon: Icon(
                          Icons.list_rounded,
                          color: controller.getIndex() == 1
                              ? Colors.white
                              : Colors.grey[400],
                        ),
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
