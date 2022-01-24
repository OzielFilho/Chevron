import 'package:flutter/material.dart';

class MaterialButtomCustom extends StatelessWidget {
  final Function action;
  final String text;
  final Alignment alignment;
  const MaterialButtomCustom(
      {Key? key,
      required this.action,
      required this.text,
      required this.alignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: MaterialButton(
        onPressed: () => action(),
        color: Theme.of(context).primaryColor,
        child: Text(
          text,
          style: Theme.of(context).textTheme.button,
        ),
      ),
    );
  }
}
