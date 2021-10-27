import 'package:flutter/material.dart';

class TextButtomCustom extends StatelessWidget {
  final Function action;
  final String title;
  final Alignment alignment;
  const TextButtomCustom(
      {Key? key,
      required this.action,
      required this.title,
      required this.alignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: TextButton(
        onPressed: () => action(),
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }
}
