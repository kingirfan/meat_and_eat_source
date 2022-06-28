
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meat_and_eat/logic/controllers/products_controller.dart';

class SearchFormText extends StatelessWidget {
   SearchFormText({Key? key}) : super(key: key);
  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(builder: (_) {
          return TextFormField(
            cursorColor: Colors.black,
            keyboardType: TextInputType.text,
            controller: controller.searchController,
            onChanged: (searchName){
              controller.addSearchToList(searchName);
            },
            decoration:  InputDecoration(
                fillColor: Colors.white,
                focusColor: Colors.red,
                filled: true,
                suffixIcon: controller.searchController.text.isEmpty  ? IconButton(
                  icon: const Icon(Icons.close,
                      color: Colors.black),
                  onPressed: (){
                    controller.clearSearch();
                  },
                ) : null,
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search your-re looking for',
                hintStyle: const TextStyle(
                    color: Colors.black45,
                    fontSize: 12,
                    fontWeight: FontWeight.w500
                ),
                enabledBorder:  OutlineInputBorder(
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
                )
            ),
          );
    },);
  }
}
