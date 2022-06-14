import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final Function validation;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final String hintText;

  AuthTextFormField({
    Key? key,
    required this.controller,
    required this.obscureText,
    required this.validation,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      cursorColor: Colors.black,
      keyboardType: TextInputType.text,
      validator: (value) => validation(value),
      decoration: InputDecoration(
          fillColor: Colors.grey.shade200,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.black45,
          fontSize: 16,
          fontWeight: FontWeight.w500
        ),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(10)
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(10)
        ),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(10)
        ),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(10)
        ),
      ),

    );
  }
}
