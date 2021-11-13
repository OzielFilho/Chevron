import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../home_controller.dart';
import '../../scheduling_controller.dart';

class FinalizeSchedule extends StatefulWidget {
  final ScrollController scrollController;
  const FinalizeSchedule({Key? key, required this.scrollController})
      : super(key: key);

  @override
  _FinalizeScheduleState createState() => _FinalizeScheduleState();
}

class _FinalizeScheduleState extends State<FinalizeSchedule> {
  final controllerHome = Modular.get<HomeController>();
  final schedulingController = Modular.get<SchedulingController>();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          padding: EdgeInsets.zero,
          controller: widget.scrollController,
          itemBuilder: (c, i) {
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
                                schedulingController
                                    .schedulesFinalize[i].barbers!.photo!,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(schedulingController
                                .schedulesFinalize[i].nameStore!),
                          ],
                        ),
                        Text(
                            'R\$ ${(schedulingController.schedulesFinalize[i].service!.valueService! / 100).toStringAsFixed(2)}'),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Identificador - ' +
                          schedulingController.schedulesFinalize[i].orderId!
                              .toString(),
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Text(
                      'Nome do Cliente: ' +
                          schedulingController.schedulesFinalize[i].clientName!,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Text(
                      'Dia: ' +
                          schedulingController.schedulesFinalize[i].updateAt!,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: schedulingController.schedulesFinalize.length,
          shrinkWrap: true,
        ));
  }
}
