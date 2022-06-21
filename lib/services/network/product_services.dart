import 'package:http/http.dart' as http;
import 'package:meat_and_eat/model/product_models.dart';
import 'package:meat_and_eat/utils/strings.dart';

class ProductServices {
  static Future<List<ProductModels>> getProduct() async {
    var response = await http.get(Uri.parse('${baseUrl}products'));
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return productModelsFromJson(jsonData);
    } else {
      return throw Exception("Failed to load product");
    }
  }
}
