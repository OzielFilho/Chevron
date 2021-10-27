import 'package:barbershop/app/modules/home/home_module.dart';
import 'package:barbershop/app/modules/login/login_module.dart';
import 'package:barbershop/app/modules/splash/splash_controller.dart';
import 'package:barbershop/app/modules/splash/splash_page.dart';

import 'package:flutter_modular/flutter_modular.dart';

class SplashModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind((i) => SplashController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (context, _) => const SplashPage(),
            transition: TransitionType.leftToRight,
            duration: const Duration(milliseconds: 800)),
        ModuleRoute('/login',
            module: LoginModule(),
            transition: TransitionType.leftToRight,
            duration: const Duration(milliseconds: 800)),
        ModuleRoute('/home',
            module: HomeModule(),
            transition: TransitionType.leftToRight,
            duration: const Duration(milliseconds: 800)),
      ];
}
