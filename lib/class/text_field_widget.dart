import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatefulWidget {
  // const TextFieldWidget({super.key});
  final String labelText;
  final icon;
  final bool obscureText;
  final suffixIcon;
  String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final TextInputType? keyboardType;

  TextFieldWidget({
    required this.labelText,
    required this.icon,
    required this.obscureText,
    required this.suffixIcon,
    required this.validator,
    required this.onSaved,
    this.keyboardType,
  });

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  TextEditingController _controller = TextEditingController();
  String? errorText;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void clearTextField() {
    setState(() {
      _controller.text = '';
      errorText = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    String? Function(String?)? validator = widget.validator;
    return Container(
      child: TextFormField(
        controller: _controller,
        keyboardType: widget.keyboardType,
        // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        validator: (value) {
          if (widget.validator != null) {
            // Invoke the validator function from the parent widget
            final errorMessage = widget.validator!(value);
            setState(() {
              errorText =
                  errorMessage; // Set the error text if validation fails
            });
            return errorMessage; // Return the error message
          }
          return null;
        },
        onSaved: widget.onSaved,
        style: TextStyle(
            fontSize: 24,
            color: Color(0xFF037E85),
            fontWeight: FontWeight.bold,
            fontFamily: 'iranSans,'),
        textAlign: TextAlign.right,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          hintText: widget.labelText,
          hintStyle: TextStyle(
            color: Colors.grey,
            // fontFamily: 'iranSans',
            fontSize: 24,
          ),
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          prefixIcon: widget.suffixIcon,
          suffixIcon: Tooltip(
            message: 'پاکسازی شماره',
            child: GestureDetector(
              onTap: clearTextField,
              child: Icon(
                widget.icon,
                color: Color(0xFF5E6E6D),
                size: 34,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
