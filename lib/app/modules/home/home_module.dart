import 'package:barbershop/app/modules/home/home_controller.dart';
import 'package:barbershop/app/modules/home/pages/initial_page/initial_controller.dart';
import 'package:barbershop/app/modules/home/pages/initial_page/initial_page.dart';
import 'package:barbershop/app/modules/home/pages/scheduling_page/scheduling_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind((i) => HomeController()),
        Bind((i) => InitialController()),
        Bind((i) => SchedulingController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (context, _) => const HomePage(),
            transition: TransitionType.leftToRight,
            duration: const Duration(milliseconds: 800)),
        ChildRoute('/initial',
            child: (context, _) => const InitialPage(),
            transition: TransitionType.leftToRight,
            duration: const Duration(milliseconds: 800))
      ];
}
