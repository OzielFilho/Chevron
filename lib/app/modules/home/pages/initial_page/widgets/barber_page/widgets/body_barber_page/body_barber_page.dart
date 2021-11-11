import 'dart:math';

import 'package:barbershop/app/modules/home/home_controller.dart';
import 'package:barbershop/app/modules/home/models/schedule.dart';
import 'package:barbershop/app/modules/home/models/services_barber.dart';
import 'package:barbershop/app/modules/home/pages/initial_page/widgets/barber_page/barber_page_controller.dart';
import 'package:barbershop/app/modules/home/pages/initial_page/widgets/barber_page/models/hours.dart';
import 'package:barbershop/app/shared/utils/widgets/buttons/material_buttom_custom.dart';
import 'package:barbershop/app/shared/utils/widgets/buttons/text_buttom_custom.dart';
import 'package:barbershop/app/shared/utils/widgets/modals/popover_modal_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../initial_controller.dart';

class BodyBarberPageWidget extends StatefulWidget {
  final int index;
  const BodyBarberPageWidget({Key? key, required this.index}) : super(key: key);

  @override
  State<BodyBarberPageWidget> createState() => _BodyBarberPageWidgetState();
}

class _BodyBarberPageWidgetState extends State<BodyBarberPageWidget> {
  final controllerInitial = Modular.get<InitialController>();

  final controllerBarber = Modular.get<BarberPageController>();

  final controllerHome = Modular.get<HomeController>();

  int indexService = -1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Serviços',
            style: Theme.of(context).textTheme.bodyText2,
          ),
          controllerInitial
                  .stores!.listBarbers[widget.index].services!.isNotEmpty
              ? ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemBuilder: (c, i) {
                    ServiceBarber service = controllerInitial
                        .stores!.listBarbers[widget.index].services![i];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 135,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: Colors.grey[100]!.withOpacity(0.6),
                            ),
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            service.nameService!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2,
                                          ),
                                          Text(service.descriptionService!,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline3),
                                        ],
                                      ),
                                      Text(
                                        'R\$' +
                                            (service.valueService! / 100)
                                                .toStringAsFixed(2),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    width: 100,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 0.4,
                                            color:
                                                Theme.of(context).primaryColor),
                                        borderRadius:
                                            BorderRadius.circular(12.0)),
                                    child: TextButtomCustom(
                                        action: () {
                                          setState(() {
                                            indexService = i;
                                          });
                                          _handleFABPressed(context);
                                        },
                                        title: 'Adicionar',
                                        alignment: Alignment.bottomCenter),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: controllerInitial
                      .stores!.listBarbers[widget.index].services!.length,
                )
              : Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'A loja não possui serviços',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                )
        ],
      ),
    );
  }

  void _handleFABPressed(BuildContext context) {
    int indexProfessional = -1;
    int indexHour = -1;
    int count = 0;
    List<Hours> hours = [
      Hours(day: 'Segunda', hour: '12:00'),
      Hours(day: 'Quarta', hour: '13:00'),
      Hours(day: 'Sexta', hour: '10:00'),
    ];
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return Popover(
            child: Column(
              children: [
                const Text('Finalizar Agendamento'),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Escolha um Profissional'),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 131,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: controllerBarber.professionals.length,
                          itemBuilder: (c, i) => InkWell(
                            onTap: () {
                              setState(() {
                                indexProfessional = i;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 40,
                                    backgroundColor:
                                        Theme.of(context).primaryColor,
                                    child: Container(
                                      height: 75,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            colorFilter: indexProfessional == i
                                                ? ColorFilter.mode(
                                                    Colors.black
                                                        .withOpacity(0.4),
                                                    BlendMode.darken)
                                                : null,
                                            image: NetworkImage(
                                              controllerBarber
                                                  .professionals[i].photo,
                                            ),
                                          )),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    controllerBarber.professionals[i].name,
                                    style:
                                        Theme.of(context).textTheme.headline3,
                                  ),
                                  Text(
                                    'HairStyle',
                                    style:
                                        Theme.of(context).textTheme.headline3,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (indexProfessional >= 0)
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        const Text('Escolha um Horário'),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 65,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: hours.length,
                            itemBuilder: (c, i) => InkWell(
                              onTap: () {
                                setState(() {
                                  indexHour = i;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 65,
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      color: indexHour == i
                                          ? Colors.black.withOpacity(0.2)
                                          : Theme.of(context).backgroundColor,
                                      border: Border.all(
                                          color:
                                              Theme.of(context).primaryColor),
                                      borderRadius:
                                          BorderRadius.circular(12.0)),
                                  child: Column(
                                    children: [
                                      Text(
                                        hours[i].day,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3,
                                      ),
                                      Text(
                                        hours[i].hour,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                if (indexHour >= 0)
                  MaterialButtomCustom(
                      action: () async {
                        await controllerHome
                            .createNewSchedule(
                                context: context,
                                schedule: Schedule(
                                    complete: false,
                                    orderId: Random().nextInt(200),
                                    updateAt: hours[indexHour].day,
                                    barbers: controllerInitial
                                        .stores!.listBarbers[widget.index],
                                    clientName:
                                        controllerHome.userFirebase!.name,
                                    createAt: DateTime.now().toString(),
                                    nameStore: controllerInitial
                                        .stores!.listBarbers[widget.index].name,
                                    service: controllerInitial
                                        .stores!
                                        .listBarbers[widget.index]
                                        .services![indexService]))
                            .whenComplete(() async {
                          Navigator.of(context).popUntil((_) => count++ >= 2);
                          controllerHome.getUserinFirestore();
                          setState(() {
                            controllerHome.setIndex(1);
                          });
                        });
                      },
                      text: 'Agendar',
                      alignment: Alignment.center),
              ],
            ),
          );
        });
      },
    );
  }
}
