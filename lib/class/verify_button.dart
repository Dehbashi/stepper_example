import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';

class VerifyButton extends StatefulWidget {
  final String title;
  final GlobalKey<FormState> formkey;
  final void Function() onPressed;

  VerifyButton(
      {required this.title, required this.formkey, required this.onPressed});

  @override
  State<VerifyButton> createState() => _VerifyButtonState();
}

class _VerifyButtonState extends State<VerifyButton> {
  late final String title = widget.title;
  late final GlobalKey<FormState> formkey = widget.formkey;
  late final void Function() onPressed = widget.onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 50,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide.none,
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
            Color(0xFF04A8B2),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
