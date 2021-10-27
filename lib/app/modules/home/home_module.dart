import 'package:barbershop/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind((i) => HomeController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (context, _) => const HomePage(),
            transition: TransitionType.leftToRight,
            duration: const Duration(milliseconds: 800))
      ];
}
