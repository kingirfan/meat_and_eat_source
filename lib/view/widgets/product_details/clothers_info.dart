import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:meat_and_eat/logic/controllers/products_controller.dart';
import 'package:meat_and_eat/utils/theme.dart';
import 'package:meat_and_eat/view/widgets/text_utils.dart';
import 'package:readmore/readmore.dart';

class ClothesInfo extends StatelessWidget {
  final String title;
  final int productId;
  final double rate;
  final String description;

  ClothesInfo({
    Key? key,
    required this.title,
    required this.productId,
    required this.rate,
    required this.description,
  }) : super(key: key);

  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Obx(() => Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Get.isDarkMode
                            ? Colors.white.withOpacity(0.9)
                            : Colors.grey.withOpacity(0.4),
                        shape: BoxShape.circle),
                    child: InkWell(
                      onTap: () {
                        controller.manageFavourites(productId);
                      },
                      child: controller.isFavourites(productId)
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 20,
                            )
                          : const Icon(
                              Icons.favorite_border_outlined,
                              color: Colors.black,
                              size: 20,
                            ),
                    ),
                  )),
            ],
          ),
          TextUtils(
            text: "$rate",
            fontSize: 14,
            fontWeight: FontWeight.bold,
            colors: Get.isDarkMode ? Colors.white : Colors.black,
            textDecoration: TextDecoration.none,
          ),
          IgnorePointer(
            ignoring: true,
            child: RatingBar.builder(
              initialRating: rate,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 20,
              unratedColor: Colors.grey,
              itemBuilder: (context, index) {
                return const Icon(
                  Icons.star,
                  size: 20,
                  color: Colors.yellow,
                );
              },
              onRatingUpdate: (update) {},
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ReadMoreText(
            description,
            trimLines: 3,
            textAlign: TextAlign.justify,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Show More',
            trimExpandedText: 'Show Less',
            lessStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? pinkClr : mainColor
            ),
            moreStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode ? pinkClr : mainColor
            ),
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                height: 2,
                color: Get.isDarkMode ? Colors.white : Colors.black
            ),
          )
        ],
      ),
    );
  }
}
