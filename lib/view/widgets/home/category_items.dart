import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:meat_and_eat/logic/controllers/category_controller.dart';

import '../../../logic/controllers/cart_controller.dart';
import '../../../logic/controllers/products_controller.dart';
import '../../../model/product_models.dart';
import '../../../utils/theme.dart';
import '../../screens/product_detail_screens.dart';
import '../text_utils.dart';

class CategoryItems extends StatelessWidget {
  CategoryItems({Key? key, required this.title}) : super(key: key);
  final String title;
  final controller = Get.find<ProductController>();
  final cartController = Get.find<CartController>();
  final categoryController = Get.find<CategoryController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (categoryController.isAllCategory.value) {
                print('object  ${categoryController.isAllCategory.value}');
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              else {
                print('object  ${categoryController.isAllCategory.value}');
                return GridView.builder(
                  itemCount: categoryController.allCategoryList.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    childAspectRatio: 0.8,
                    mainAxisSpacing: 9.0,
                    crossAxisSpacing: 6.0,
                    maxCrossAxisExtent: 200,
                  ),
                  itemBuilder: (context, index) {
                    return buildCardItems(
                        image: categoryController.allCategoryList[index].image,
                        price: categoryController.allCategoryList[index].price,
                        rate: categoryController.allCategoryList[index].rating
                            .rate,
                        productId: categoryController.allCategoryList[index].id,
                        productModels: categoryController
                            .allCategoryList[index],
                        onTap: () {
                          Get.to(
                                () =>
                                ProductDetailsScreen(
                                  productModels: categoryController.allCategoryList[index],
                                ),
                          );
                        });
                  },
                );
              }
            }),
          ),
        ],
      ),
    );
  }

  Widget buildCardItems({required String image,
    required double price,
    required double? rate,
    required int productId,
    required ProductModels productModels,
    required Function() onTap}) {
    return Padding(
      padding: const EdgeInsets.all(
        5,
      ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 3.0,
                    blurRadius: 5.0)
              ]),
          child: Column(
            children: [
              Obx(() =>
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          controller.manageFavourites(productId);
                        },
                        icon: controller.isFavourites(productId)
                            ? const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                            : const Icon(
                          Icons.favorite_border_outlined,
                          color: Colors.black,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          cartController.addProductToCart(productModels);
                        },
                        icon: const Icon(
                          Icons.shopping_cart,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  )),
              Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Image.network(
                  image,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$ $price',
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: 20,
                      width: 45,
                      decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 3,
                          right: 2,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextUtils(
                              text: '${rate}',
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              colors: Colors.white,
                              textDecoration: TextDecoration.none,
                            ),
                            const Icon(
                              Icons.star,
                              size: 13,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
