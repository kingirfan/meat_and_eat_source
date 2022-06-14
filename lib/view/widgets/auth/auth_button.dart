import 'package:flutter/material.dart';
import 'package:meat_and_eat/utils/theme.dart';
import 'package:meat_and_eat/view/widgets/text_utils.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Function() function;

  const AuthButton({
    Key? key,
    required this.text,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: function,
      child: TextUtils(
        text: text,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        colors: Colors.white,
        textDecoration: TextDecoration.none,
      ),
      style: ElevatedButton.styleFrom(
          primary: mainColor, minimumSize: const Size(360, 50)),
    );
  }
}
