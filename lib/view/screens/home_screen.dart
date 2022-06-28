import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meat_and_eat/utils/theme.dart';
import 'package:meat_and_eat/view/widgets/home/cart_items.dart';
import 'package:meat_and_eat/view/widgets/text_utils.dart';

import '../widgets/home/search_text_form.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                  color: Get.isDarkMode ? darkGreyClr : mainColor,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextUtils(
                      text: 'Find Your',
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      colors: Colors.white,
                      textDecoration: TextDecoration.none,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextUtils(
                      text: 'INSPIRATION',
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      colors: Colors.white,
                      textDecoration: TextDecoration.none,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SearchFormText()
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: TextUtils(
                  text: 'Categories',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  colors: Get.isDarkMode ? Colors.white : Colors.black,
                  textDecoration: TextDecoration.none,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            CartItems()
          ],
        ),
      ),
    );
  }
}
