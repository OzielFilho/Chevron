import 'package:barbershop/app/shared/utils/widgets/buttons/material_buttom_custom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  logout() async {
    FirebaseAuth.instance
        .signOut()
        .whenComplete(() => Modular.to.pushReplacementNamed('/login'));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButtomCustom(
        action: logout,
        text: 'Sair',
        alignment: Alignment.center,
      ),
    );
  }
}
