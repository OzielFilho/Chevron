import 'package:barbershop/app/modules/home/home_module.dart';
import 'package:barbershop/app/modules/login/login_controller.dart';
import 'package:barbershop/app/modules/login/login_page.dart';
import 'package:barbershop/app/modules/login/pages/create_account/create_account.dart';
import 'package:barbershop/app/modules/login/pages/create_account/create_account_with_firebase_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind((i) => LoginController()),
        Bind((i) => CreateAccountWithFirebaseController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (context, _) => const LoginPage(),
            transition: TransitionType.leftToRight,
            duration: const Duration(milliseconds: 800)),
        ChildRoute('/create',
            child: (_, __) => const CreateAccountWithFirebasePage(),
            transition: TransitionType.leftToRight,
            duration: const Duration(milliseconds: 800)),
        ModuleRoute('/home',
            module: HomeModule(),
            transition: TransitionType.leftToRight,
            duration: const Duration(milliseconds: 800)),
      ];
}
