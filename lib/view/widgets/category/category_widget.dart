import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meat_and_eat/logic/controllers/category_controller.dart';

import '../home/category_items.dart';

class CategoryWidget extends StatelessWidget {

  CategoryWidget({Key? key}) : super(key: key);

  final controller = Get.find<CategoryController>();
  List<String> imageList = [
    'https://fakestoreapi.com/img/61mtL65D4cL._AC_SX679_.jpg',
    'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
    'https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_.jpg',
    'https://fakestoreapi.com/img/61IBBVJvSDL._AC_SY879_.jpg',

  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isAllCategory.value) {
        return const Center(child: CircularProgressIndicator(),);
      }
      else {
        return Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () async{
                  await controller.getCategoryIndex(index);
                  Get.to(() => CategoryItems(title: controller.categoryList[index],));

                },
                child: Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    image:  DecorationImage(
                        image: NetworkImage(
                          imageList[index],
                        ),
                        fit: BoxFit.cover),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      bottom: 10,
                    ),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        controller.categoryList[index],
                        style: const TextStyle(
                            backgroundColor: Colors.black38,
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 20);
            },
            itemCount: controller.categoryList.length,
          ),
        );
      }
    });
  }
}
