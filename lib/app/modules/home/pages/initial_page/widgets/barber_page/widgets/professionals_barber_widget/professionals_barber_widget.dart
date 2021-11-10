import 'package:barbershop/app/modules/home/pages/initial_page/widgets/barber_page/barber_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProfessionalsBarberWidget extends StatefulWidget {
  final bool actionActive;
  const ProfessionalsBarberWidget({Key? key, required this.actionActive})
      : super(key: key);

  @override
  _ProfessionalsBarberWidgetState createState() =>
      _ProfessionalsBarberWidgetState();
}

class _ProfessionalsBarberWidgetState extends State<ProfessionalsBarberWidget> {
  final controllerBarber = Modular.get<BarberPageController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 153,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Profissionais'),
            SizedBox(
              height: 131,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: controllerBarber.professionals.length,
                  itemBuilder: (c, i) {
                    bool professionalClick = false;
                    return InkWell(
                      onTap: widget.actionActive
                          ? () {
                              setState(() {
                                professionalClick = !professionalClick;
                              });
                            }
                          : null,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundColor: Theme.of(context).primaryColor,
                              child: Container(
                                height: 75,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      colorFilter: professionalClick
                                          ? ColorFilter.mode(
                                              Colors.black.withOpacity(0.4),
                                              BlendMode.darken)
                                          : null,
                                      image: NetworkImage(
                                        controllerBarber.professionals[i].photo,
                                      ),
                                    )),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              controllerBarber.professionals[i].name,
                              style: Theme.of(context).textTheme.headline3,
                            ),
                            Text(
                              'HairStyle',
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
