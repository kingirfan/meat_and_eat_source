import 'package:flutter/material.dart';
import 'package:meat_and_eat/utils/theme.dart';
import 'package:meat_and_eat/view/widgets/text_utils.dart';

class ContainerUnder extends StatelessWidget {
  final String text, textType;
  final Function() function;

  const ContainerUnder({
    Key? key,
    required this.text,
    required this.function,
    required this.textType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: const BoxDecoration(
          color: mainColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextUtils(
            text: text,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            colors: Colors.white,
            textDecoration: TextDecoration.none,
          ),
          TextButton(
            onPressed: function,
            child: TextUtils(
              text: textType,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              colors: Colors.white,
              textDecoration: TextDecoration.none,
            ),
          )
        ],
      ),
    );
  }
}
