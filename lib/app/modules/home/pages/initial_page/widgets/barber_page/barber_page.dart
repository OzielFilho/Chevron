import 'package:barbershop/app/modules/home/pages/initial_page/initial_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
          children: [
            Text(controllerInitial.stores!.listBarbers[widget.index].name!),
          ],
        ),
      ),
    );
  }
}
