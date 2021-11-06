import 'package:barbershop/app/modules/home/pages/initial_page/initial_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HeaderBarberPageWidget extends StatelessWidget {
  final int? index;
  HeaderBarberPageWidget({Key? key, this.index}) : super(key: key);

  final controllerInitial = Modular.get<InitialController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipPath(
            clipper: OvalBottomBorderClipper(),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.5), BlendMode.darken),
                    image: NetworkImage(
                        controllerInitial.stores!.listBarbers[index!].photo!),
                    fit: BoxFit.cover),
              ),
              width: MediaQuery.of(context).size.width,
              height: 180,
              alignment: Alignment.centerRight,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: Colors.white,
                      ))
                ],
              ),
            )),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        Text(
          controllerInitial.stores!.listBarbers[index!].name!,
          style: Theme.of(context).textTheme.headline1,
        ),
        Text(
          controllerInitial.stores!.listBarbers[index!].description!,
          style: Theme.of(context).textTheme.headline3,
        ),
      ],
    );
  }
}
