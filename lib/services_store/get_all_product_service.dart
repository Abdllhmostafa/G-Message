import 'package:graduated_project/helper_store/api.dart';
import 'package:graduated_project/models_store/product_model.dart';

class AllProductService {
  Future<List<ProductModel>> getAllProducts() async {
    List<dynamic> data = await Api()
        .get(url: 'http://healthdragon.atwebpages.com/api/v1/medicines');

    List<ProductModel> productList = [];
    for (int i = 0; i < data.length; i++) {
      productList.add(
        ProductModel.fromJson(data[i]),
      );
    }
    return productList;
  }
}
