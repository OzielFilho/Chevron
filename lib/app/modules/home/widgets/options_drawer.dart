import 'package:barbershop/app/shared/utils/widgets/buttons/text_buttom_custom.dart';
import 'package:flutter/material.dart';

class OptionsDrawer extends StatefulWidget {
  const OptionsDrawer({Key? key}) : super(key: key);

  @override
  _OptionsDrawerState createState() => _OptionsDrawerState();
}

class _OptionsDrawerState extends State<OptionsDrawer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 15,
        ),
        TextButtomCustom(
            action: () {},
            title: '- Suas Reservas',
            alignment: Alignment.centerLeft),
        TextButtomCustom(
            action: () {},
            title: '- Seu Perfil',
            alignment: Alignment.centerLeft),
      ],
    );
  }
}
