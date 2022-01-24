import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showLoading({required BuildContext context}) {
  return showDialog(
      context: context,
      builder: (c) => Center(
            child: CircularProgressIndicator(
              valueColor:
                  AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
            ),
          ));
}
