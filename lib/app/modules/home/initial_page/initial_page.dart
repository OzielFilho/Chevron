import 'package:barbershop/app/modules/home/initial_page/initial_controller.dart';
import 'package:barbershop/app/modules/home/initial_page/widgets/barbersList/barbers_list_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends ModularState<InitialPage, InitialController> {
  initPage() async {
    await controller.getBarbersStoreinFirestore();
  }

  @override
  void initState() {
    initPage();
    super.initState();
  }

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        controller: _scrollController,
        child: ConstrainedBox(
          constraints: constraints,
          child: Observer(
            builder: (_) => SafeArea(
              child: Column(
                children: [
                  const Text('Barbearias: '),
                  controller.stores != null
                      ? BarberListWidget(
                          scrollController: _scrollController,
                        )
                      : Container()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
