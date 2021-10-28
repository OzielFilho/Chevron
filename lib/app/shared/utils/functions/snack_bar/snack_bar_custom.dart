import 'package:flutter/material.dart';

showSnackBar({BuildContext? context, String? body, Function? action}) {
  SnackBar snackBar = SnackBar(
    content: Text(body!),
    action: action != null
        ? SnackBarAction(label: 'Desfazer', onPressed: () => action)
        : null,
  );
  return ScaffoldMessenger.of(context!).showSnackBar(snackBar);
}
