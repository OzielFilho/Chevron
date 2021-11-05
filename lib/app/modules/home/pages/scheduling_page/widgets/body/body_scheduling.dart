import 'package:barbershop/app/modules/home/home_controller.dart';
import 'package:barbershop/app/modules/home/models/schedule.dart';
import 'package:barbershop/app/modules/home/pages/scheduling_page/widgets/schedules_list/schedules_list.dart';
import 'package:barbershop/app/shared/utils/widgets/buttons/material_buttom_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BodyScheduling extends StatefulWidget {
  final ScrollController scrollController;
  const BodyScheduling({Key? key, required this.scrollController})
      : super(key: key);

  @override
  _BodySchedulingState createState() => _BodySchedulingState();
}

class _BodySchedulingState extends State<BodyScheduling> {
  final controllerHome = Modular.get<HomeController>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: widget.scrollController,
      child: Center(
        child: Column(
          children: [
            MaterialButtomCustom(
              action: () async {
                await controllerHome
                    .createNewSchedule(
                        context: context,
                        schedule: Schedule(
                            nameStore: 'Barber Shop',
                            barbers: null,
                            clientName: 'Juvenal',
                            createAt: DateTime.now().toString(),
                            service: null,
                            updateAt: DateTime.now().toString()))
                    .whenComplete(() {
                  controllerHome.getUserinFirestore();
                  setState(() {});
                });
              },
              alignment: Alignment.center,
              text: 'Criar agendamento',
            ),
            SchedulesListWidget(
              scrollController: widget.scrollController,
            ),
          ],
        ),
      ),
    );
  }
}
