import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:meat_and_eat/logic/controllers/cart_controller.dart';
import 'package:meat_and_eat/routes/routes.dart';
import 'package:meat_and_eat/utils/theme.dart';
import 'package:meat_and_eat/view/widgets/product_details/color_picker.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'clothers_info.dart';

class ImageSliders extends StatefulWidget {
  final String imageUrl;

  ImageSliders({Key? key, required this.imageUrl}) : super(key: key);

  @override
  State<ImageSliders> createState() => _ImageSlidersState();
}

class _ImageSlidersState extends State<ImageSliders> {
  final cartController = Get.find<CartController>();
  CarouselController carouselController = CarouselController();
  int currentPage = 0;
  int currentColor = 0;
  List<Color> colorSelected = [
    kCOlor1,
    kCOlor2,
    kCOlor3,
    kCOlor4,
    kCOlor5,
    kCOlor2,
    kCOlor3,
    kCOlor4,
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: 3,
          carouselController: carouselController,
          options: CarouselOptions(
              height: 500,
              viewportFraction: 1,
              autoPlay: true,
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
              autoPlayInterval: const Duration(
                seconds: 2,
              ),
              onPageChanged: (index, reson) {
                setState(() {
                  currentPage = index;
                });
              }),
          itemBuilder: (context, index, realIndex) {
            return Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      widget.imageUrl,
                    ),
                    fit: BoxFit.fill),
                borderRadius: BorderRadius.circular(
                  25,
                ),
              ),
            );
          },
        ),
        Positioned(
          bottom: 30,
          left: 180,
          child: AnimatedSmoothIndicator(
            activeIndex: currentPage,
            count: 3,
            effect: ExpandingDotsEffect(
                dotHeight: 10,
                dotWidth: 10,
                activeDotColor: Get.isDarkMode ? pinkClr : mainColor,
                dotColor: Colors.black),
          ),
        ),
        Positioned(
          right: 30,
          bottom: 30,
          child: Container(
            height: 200,
            width: 50,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(30)),
            child: ListView.separated(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      currentColor = index;
                    });
                  },
                  child: ColorPicker(
                    color: colorSelected[index],
                    outerBorder: currentColor == index,
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 3,
                );
              },
              itemCount: colorSelected.length,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(
                top: 20,
                left: 25,
                right: 25,
              ),
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Get.isDarkMode
                          ? pinkClr.withOpacity(0.8)
                          : mainColor.withOpacity(0.8),
                      shape: BoxShape.circle),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Get.isDarkMode ? Colors.black :Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
            Obx(() => Badge(
              position: BadgePosition.topEnd(top: 5, end: 20),
              animationDuration: const Duration(milliseconds: 300),
              animationType: BadgeAnimationType.slide,
              badgeContent: Text(
                "${cartController.quantity().toString()} ",
                style: const TextStyle(color: Colors.white),
              ),
              child: Container(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 25,
                  right: 25,
                ),
                child: InkWell(
                  onTap: () {
                    Get.toNamed(Routes.cartScreen);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Get.isDarkMode
                            ? pinkClr.withOpacity(0.8)
                            : mainColor.withOpacity(0.8),
                        shape: BoxShape.circle),
                    child: Icon(
                      Icons.shopping_cart,
                      color: Get.isDarkMode ? Colors.black :Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),),

          ],
        )
      ],
    );
  }
}
