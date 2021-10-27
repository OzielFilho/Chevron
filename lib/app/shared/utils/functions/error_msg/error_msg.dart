import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

showErrorMessage(
    {required BuildContext context,
    required String message,
    required String title}) {
  TextButton ok = TextButton(
    onPressed: () => Modular.to.pop(),
    child: const Text('Ok'),
  );
  AlertDialog alertDialog =
      AlertDialog(content: Text(message), title: Text(title), actions: [ok]);
  return showDialog(context: context, builder: (c) => alertDialog);
}
