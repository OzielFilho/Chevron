import 'package:barbershop/app/modules/login/login_controller.dart';
import 'package:barbershop/app/core/utils/widgets/buttons/material_buttom_custom.dart';
import 'package:barbershop/app/core/utils/widgets/buttons/text_buttom_custom.dart';
import 'package:barbershop/app/core/utils/widgets/textfield/textformfield_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _key,
            child: LayoutBuilder(builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 420,
                        width: 420,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/logo.png'))),
                      ),
                      const Text('Insira seus dados'),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormFieldCustom(
                          controllerText: controller.controllerEmail,
                          title: 'Email',
                          icon: Icons.email_outlined),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormFieldCustom(
                        controllerText: controller.controllerPassword,
                        title: 'Senha',
                        obscureText: true,
                        icon: Icons.lock_outline_rounded,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      MaterialButtomCustom(
                        alignment: Alignment.center,
                        action: () async {
                          if (_key.currentState!.validate()) {
                            await controller.loginFirebase(context);
                          }
                        },
                        text: 'Fazer o Login',
                      ),
                      TextButtomCustom(
                        alignment: Alignment.center,
                        title: 'Criar uma conta!',
                        action: () => Modular.to.pushNamed('create'),
                      )
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
