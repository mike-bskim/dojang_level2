import 'package:get/get.dart';

import '../model/model_product.dart';
import '../services/service_product.dart';

class ProductController extends GetxController {
  static ProductController get to => Get.find();

  // 화면 표시용 객체
  var productList = <Product>[].obs;

  /* *********** 도장깨기 미션 *********** */
  var cartItems = <Product>[].obs;
  int get count => cartItems.length;
  addToItem(Product product){
    cartItems.add(product);
  }
  /* *********** 도장깨기 미션 *********** */

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    var products = await Services.fetchProducts();
    if(products != null){
      productList.value = products;
      // productList(products);
    }
  }

}