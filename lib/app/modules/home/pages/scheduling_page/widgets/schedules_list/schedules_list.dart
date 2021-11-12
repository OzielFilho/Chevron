import 'package:barbershop/app/modules/home/home_controller.dart';
import 'package:barbershop/app/modules/home/models/schedule.dart';
import 'package:barbershop/app/modules/home/pages/scheduling_page/scheduling_controller.dart';
import 'package:barbershop/app/shared/utils/functions/confirme_dialog/confirme_dialog.dart';
import 'package:barbershop/app/shared/utils/widgets/buttons/material_buttom_custom.dart';
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
  final schedulingController = Modular.get<SchedulingController>();
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            controller: widget.scrollController,
            itemBuilder: (c, i) {
              Schedule schedule = schedulingController.schedules[i];
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundColor:
                                    Theme.of(context).backgroundColor,
                                backgroundImage: NetworkImage(
                                  schedule.barbers!.photo!,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(schedule.nameStore!),
                            ],
                          ),
                          Text(
                              'R\$ ${(schedule.service!.valueService! / 100).toStringAsFixed(2)}'),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Identificador - ' + schedule.orderId!.toString(),
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      Text(
                        'Nome do Cliente: ' + schedule.clientName!,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      Text(
                        'Dia: ' + schedule.updateAt!,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      MaterialButtomCustom(
                          action: () {
                            showDialogConfirme(
                                action: () {
                                  schedulingController
                                      .finalizeSchedule(
                                          context: context, indexSchedule: i)
                                      .whenComplete(
                                          () => Modular.to.pop(context));
                                },
                                context: context,
                                message: 'Deseja Finalizar?',
                                title: 'Agendamento');
                          },
                          text: 'Finalizar',
                          alignment: Alignment.center)
                    ],
                  ),
                ),
              );
            },
            itemCount: schedulingController.schedules.length,
            shrinkWrap: true,
          ));
    });
  }
}
