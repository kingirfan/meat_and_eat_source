import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:meat_and_eat/model/product_models.dart';
import 'package:meat_and_eat/services/network/product_services.dart';

class ProductController extends GetxController {
  var productList = <ProductModels>[].obs;
  var isLoading = true.obs;
  var favouriteList = <ProductModels>[].obs;
  var storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    List? storedFavourites = storage.read<List>("isFavList");
    if (storedFavourites != null) {
      favouriteList =
          storedFavourites.map((e) => ProductModels.fromJson(e)).toList().obs;
    }

    getProducts();
  }

  void getProducts() async {
    var products = await ProductServices.getProduct();

    try {
      isLoading(true);
      if (products.isNotEmpty) {
        productList.addAll(products);
      }
    } finally {
      isLoading(false);
    }
  }

  manageFavourites(int productId) async {
    var getIndex =
        favouriteList.indexWhere((element) => element.id == productId);
    if (getIndex >= 0) {
      favouriteList.removeAt(getIndex);
      await storage.remove("isFavList");
    } else {
      favouriteList
          .add(productList.firstWhere((element) => element.id == productId));
      await storage.write("isFavList", favouriteList);
    }
  }

  bool isFavourites(int productId) {
    return favouriteList.any((element) => element.id == productId);
  }
}
