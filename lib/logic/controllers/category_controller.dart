import 'package:get/get.dart';
import 'package:meat_and_eat/model/product_models.dart';
import 'package:meat_and_eat/services/network/category_services.dart';

class CategoryController extends GetxController {
  var categoryList = <String>[].obs;
  var allCategoryList = <ProductModels>[].obs;
  var isCategoryLoading = false.obs;
  var isAllCategory = false.obs;

  @override
  void onInit() {
    super.onInit();
    getCategoryList();
  }

  getCategoryList() async {
    var categoryName = await CategoryServices.getCategory();
    isCategoryLoading(true);
    try {
      if (categoryName.isNotEmpty) {
        categoryList.addAll(categoryName);
      }
    } finally {
      isCategoryLoading(false);
    }
  }

  getAllCategoriesList(String nameCategory) async {
    var categoryName = await AllCategoryServices.getAllCategories(nameCategory);
    isAllCategory(true);
    try {
      if (categoryName.isNotEmpty) {
        allCategoryList.value = categoryName;
      }
    } finally {
      isAllCategory(false);
    }
  }

  getCategoryIndex(int index) async {
    var categoryName = await getAllCategoriesList(categoryList[index]);
    if (categoryName != null) {
      allCategoryList.value = categoryName;
    }
  }
}
