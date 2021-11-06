import 'package:barbershop/app/modules/home/models/services_barber.dart';
import 'package:barbershop/app/modules/home/pages/initial_page/widgets/barber_page/widgets/professionals_barber_widget/professionals_barber_widget.dart';
import 'package:barbershop/app/shared/utils/widgets/buttons/text_buttom_custom.dart';
import 'package:barbershop/app/shared/utils/widgets/modals/popover_modal_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../initial_controller.dart';

class BodyBarberPageWidget extends StatelessWidget {
  final int index;
  BodyBarberPageWidget({Key? key, required this.index}) : super(key: key);
  final controllerInitial = Modular.get<InitialController>();
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
          controllerInitial.stores!.listBarbers[index].services!.isNotEmpty
              ? ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemBuilder: (c, i) {
                    ServiceBarber service = controllerInitial
                        .stores!.listBarbers[index].services![i];
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
                      .stores!.listBarbers[index].services!.length,
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
    showModalBottomSheet<int>(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Popover(
          child: Column(
            children: const [
              Text('Finalizar Agendamento'),
              ProfessionalsBarberWidget(
                actionActive: true,
              ),
            ],
          ),
        );
      },
    );
  }
}
