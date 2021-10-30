import 'package:barbershop/app/modules/login/pages/create_account/create_account_with_firebase_controller.dart';
import 'package:barbershop/app/shared/utils/functions/snack_bar/snack_bar_custom.dart';
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
  final _passwordConfirm = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar Conta'),
        leading: IconButton(
            onPressed: () => Modular.to.pop(context),
            icon: const Icon(Icons.arrow_back_ios_new_outlined)),
      ),
      body: Form(
        key: _key,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
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
                  TextFormFieldCustom(
                    controllerText: _passwordConfirm,
                    title: 'Confirme a Senha',
                    obscureText: true,
                    icon: Icons.lock_outline_rounded,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  MaterialButtomCustom(
                      action: () async => await createUser(context),
                      text: 'Cadastrar',
                      alignment: Alignment.center),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> createUser(BuildContext context) async {
    if (_key.currentState!.validate()) {
      if (_passwordConfirm.text == controller.passwordCreate.text) {
        await controller.createAccountWithFirebase(context: context);
      } else {
        showSnackBar(
            context: context, action: null, body: 'As senhas não coincidem');
      }
    }
  }
}
