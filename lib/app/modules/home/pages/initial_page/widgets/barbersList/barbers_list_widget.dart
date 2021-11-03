import 'package:barbershop/app/modules/home/pages/initial_page/initial_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BarberListWidget extends StatefulWidget {
  final ScrollController? scrollController;
  const BarberListWidget({Key? key, this.scrollController}) : super(key: key);

  @override
  State<BarberListWidget> createState() => _BarberListWidgetState();
}

class _BarberListWidgetState extends State<BarberListWidget> {
  @override
  Widget build(BuildContext context) {
    final controllerInitial = Modular.get<InitialController>();
    return ListView.builder(
      shrinkWrap: true,
      controller: widget.scrollController,
      itemCount: controllerInitial.stores!.listBarbers.length,
      itemBuilder: (context, index) =>
          Text(controllerInitial.stores!.listBarbers[index].name!),
    );
  }
}
