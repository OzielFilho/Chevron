import 'package:barbershop/app/modules/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends ModularState<SplashPage, SplashController> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () async {
      if (controller.isUserLogged()) {
        return Modular.to.pushReplacementNamed('/home/');
      } else {
        return Modular.to.pushReplacementNamed('/login/');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/chevron_splash.gif',
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
