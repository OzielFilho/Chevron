import 'package:barbershop/app/modules/login/pages/create_account/create_account_with_firebase_controller.dart';
import 'package:barbershop/app/shared/utils/widgets/buttons/material_buttom_custom.dart';
import 'package:barbershop/app/shared/utils/widgets/textfield/textformfield_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CreateAccountWithFirebasePage extends StatefulWidget {
  const CreateAccountWithFirebasePage({Key? key}) : super(key: key);

  @override
  _CreateAccountWithFirebasePageState createState() =>
      _CreateAccountWithFirebasePageState();
}

class _CreateAccountWithFirebasePageState extends ModularState<
    CreateAccountWithFirebasePage, CreateAccountWithFirebaseController> {
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _key,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Insira os dados para cadastrar seu usuário'),
                const SizedBox(
                  height: 15,
                ),
                TextFormFieldCustom(
                  controllerText: controller.nameCreate,
                  title: 'Seu Nome',
                  icon: Icons.person_outline_outlined,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormFieldCustom(
                  controllerText: controller.emailCreate,
                  title: 'Email',
                  icon: Icons.email_outlined,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormFieldCustom(
                  controllerText: controller.passwordCreate,
                  title: 'Senha',
                  obscureText: true,
                  icon: Icons.lock_outline_rounded,
                ),
                const SizedBox(
                  height: 15,
                ),
                MaterialButtomCustom(
                    action: () {
                      if (_key.currentState!.validate()) {
                        controller.createAccountWithFirebase(context: context);
                      }
                    },
                    text: 'Cadastrar',
                    alignment: Alignment.center),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
