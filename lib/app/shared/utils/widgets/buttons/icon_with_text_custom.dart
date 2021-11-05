import 'package:flutter/material.dart';

class IconWithTextCustom extends StatelessWidget {
  final Function? action;
  final String? text;
  final Icon? icon;
  final Color? color;
  const IconWithTextCustom(
      {Key? key,
      required this.action,
      required this.text,
      required this.icon,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
            onTap: () {
              action!();
            },
            child: icon),
        Text(
          text!,
          style: TextStyle(
            fontSize: 10,
            color: color,
          ),
        ),
      ],
    );
  }
}
