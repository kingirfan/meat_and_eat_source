import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meat_and_eat/logic/controllers/cart_controller.dart';
import 'package:meat_and_eat/logic/controllers/maincontroller.dart';
import 'package:meat_and_eat/routes/routes.dart';
import 'package:meat_and_eat/utils/theme.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final controller = Get.find<MainController>();
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
            elevation: 0,
            leading: Container(),
            actions: [
              /*IconButton(
                onPressed: () {
                  Get.toNamed(Routes.cartScreen);
                },
                icon: Image.asset(
                  'assets/images/shop.png',
                ),
              ),*/

              Obx(() {
                return Badge(
                  position: BadgePosition.topEnd(top: 0, end: 3),
                  animationDuration: const Duration(milliseconds: 300),
                  animationType: BadgeAnimationType.slide,
                  badgeContent: Text(
                    "${cartController.quantity().toString()} ",
                    style: const TextStyle(color: Colors.white),
                  ),
                  child: IconButton(
                      icon: Image.asset(
                        'assets/images/shop.png',
                      ),
                      onPressed: () {
                        Get.toNamed(Routes.cartScreen);
                      }),
                );
              })
            ],
            title: Text(controller.titles[controller.currentIndex.value]),
            centerTitle: true,
          ),
          backgroundColor: context.theme.backgroundColor,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  label: '',
                  icon: Icon(
                    Icons.home,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  activeIcon: Icon(
                    Icons.home,
                    color: Get.isDarkMode ? pinkClr : mainColor,
                  )),
              BottomNavigationBarItem(
                  label: '',
                  icon: Icon(
                    Icons.category,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  activeIcon: Icon(
                    Icons.category,
                    color: Get.isDarkMode ? pinkClr : mainColor,
                  )),
              BottomNavigationBarItem(
                  label: '',
                  icon: Icon(
                    Icons.favorite,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  activeIcon: Icon(
                    Icons.favorite,
                    color: Get.isDarkMode ? pinkClr : mainColor,
                  )),
              BottomNavigationBarItem(
                  label: '',
                  icon: Icon(
                    Icons.settings,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  activeIcon: Icon(
                    Icons.settings,
                    color: Get.isDarkMode ? pinkClr : mainColor,
                  )),
            ],
            onTap: (index) {
              controller.currentIndex.value = index;
            },
          ),
          body: IndexedStack(
            index: controller.currentIndex.value,
            children: controller.tabs,
          ),
        );
      }),
    );
  }
}
