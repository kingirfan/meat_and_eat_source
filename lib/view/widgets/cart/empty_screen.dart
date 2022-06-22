import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meat_and_eat/routes/routes.dart';
import 'package:meat_and_eat/utils/theme.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart,
            size: 150,
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
          const SizedBox(
            height: 40,
          ),
          RichText(
            text: TextSpan(
                text: "Your Cart Is ",
                style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                      text: "Empty ",
                      style: TextStyle(
                          color: Get.isDarkMode ? pinkClr : mainColor,
                          fontSize: 30,
                          fontWeight: FontWeight.bold))
                ]),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Add Items to get Started',
            style: TextStyle(
                color: Get.isDarkMode ? Colors.white : Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.mainScreen);
              },
              child: const Text(
                  'Go to Home',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 0,
                primary: Get.isDarkMode ? pinkClr :mainColor
              ),
            ),
          )
        ],
      ),
    );
  }
}
