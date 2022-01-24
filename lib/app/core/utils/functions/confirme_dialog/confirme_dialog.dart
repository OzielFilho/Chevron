import 'package:barbershop/app/core/utils/widgets/buttons/text_buttom_custom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

showDialogConfirme(
    {BuildContext? context, String? title, String? message, Function? action}) {
  TextButtomCustom ok = TextButtomCustom(
      action: action!, title: 'Finalizar', alignment: Alignment.center);
  TextButtomCustom cancel = TextButtomCustom(
      action: () => Modular.to.pop(context),
      title: 'Cancelar',
      alignment: Alignment.center);
  CupertinoAlertDialog alertDialog = CupertinoAlertDialog(
    actions: [ok, cancel],
    content: Text(message!),
    title: Text(title!),
  );
  return showDialog(context: context!, builder: (context) => alertDialog);
}
