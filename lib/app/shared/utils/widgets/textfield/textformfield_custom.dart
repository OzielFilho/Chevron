import 'package:flutter/material.dart';

class TextFormFieldCustom extends StatelessWidget {
  final TextEditingController? controllerText;
  final String title;
  final Function? action;
  final bool? obscureText;
  final IconData? icon;
  const TextFormFieldCustom(
      {Key? key,
      required this.controllerText,
      required this.title,
      this.action,
      this.icon,
      this.obscureText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return '$title não pode está vazio(a)';
        }
        if (title == 'Senha') {
          if (value.length < 6) {
            return 'A Senha não pode ser menor que 6 caracteres';
          }
        }
        if (title == 'Email') {
          if (!RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(value)) {
            return 'Digite um email válido';
          }
        }
      },
      controller: controllerText,
      keyboardType: TextInputType.text,
      obscureText: obscureText ?? false,
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
        hintText: title,
        hoverColor: Theme.of(context).primaryColor,
        focusColor: Theme.of(context).primaryColor,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        suffixIcon: Icon(
          icon,
          color: Theme.of(context).primaryColor,
        ),
        filled: true,
      ),
    );
  }
}
