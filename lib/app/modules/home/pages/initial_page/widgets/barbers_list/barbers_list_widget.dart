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
      padding: const EdgeInsets.symmetric(vertical: 10),
      itemCount: controllerInitial.stores!.listBarbers.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border:
                Border.all(width: 0.5, color: Theme.of(context).primaryColor),
          ),
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 27,
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage(
                          controllerInitial.stores!.listBarbers[index].photo!,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(controllerInitial
                              .stores!.listBarbers[index].name!),
                          Text(
                            controllerInitial
                                .stores!.listBarbers[index].description!,
                            style: Theme.of(context).textTheme.headline3,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios_outlined,
                      color: Theme.of(context).primaryColor),
                ],
              )),
        ),
      ),
    );
  }
}
