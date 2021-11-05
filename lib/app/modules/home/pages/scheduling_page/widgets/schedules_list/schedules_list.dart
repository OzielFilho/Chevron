import 'package:barbershop/app/modules/home/home_controller.dart';
import 'package:barbershop/app/modules/home/models/schedule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SchedulesListWidget extends StatefulWidget {
  final ScrollController scrollController;
  const SchedulesListWidget({Key? key, required this.scrollController})
      : super(key: key);

  @override
  _SchedulesListWidgetState createState() => _SchedulesListWidgetState();
}

class _SchedulesListWidgetState extends State<SchedulesListWidget> {
  final controllerHome = Modular.get<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: controllerHome.userFirebase!.schedules.isNotEmpty
            ? ListView.builder(
                controller: widget.scrollController,
                itemBuilder: (c, i) {
                  Schedule schedule = controllerHome.userFirebase!.schedules[i];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Text(schedule.clientName!),
                          Text(schedule.nameStore!),
                          Text(schedule.createAt!),
                          Text(schedule.updateAt!),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: controllerHome.userFirebase!.schedules.length,
                shrinkWrap: true,
              )
            : const Text('Você não possui agendamentos'),
      );
    });
  }
}
