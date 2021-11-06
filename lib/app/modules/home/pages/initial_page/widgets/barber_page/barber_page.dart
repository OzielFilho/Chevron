import 'package:barbershop/app/modules/home/pages/initial_page/initial_controller.dart';
import 'package:barbershop/app/modules/home/pages/initial_page/widgets/barber_page/widgets/header_barber_page/header_barber_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'widgets/body_barber_page/body_barber_page.dart';
import 'widgets/professionals_barber_widget/professionals_barber_widget.dart';

class BarberPage extends StatefulWidget {
  final int index;
  const BarberPage({Key? key, required this.index}) : super(key: key);

  @override
  _BarberPageState createState() => _BarberPageState();
}

class _BarberPageState extends State<BarberPage> {
  final controllerInitial = Modular.get<InitialController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderBarberPageWidget(
              index: widget.index,
            ),
            const ProfessionalsBarberWidget(
              actionActive: false,
            ),
            BodyBarberPageWidget(index: widget.index),
          ],
        ),
      ),
    );
  }
}
