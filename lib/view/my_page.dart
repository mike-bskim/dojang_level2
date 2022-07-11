import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:level02_getx/view/product_tile.dart';

import '../controller/product_controller.dart';

class MyPage extends StatelessWidget {
  MyPage({Key? key}) : super(key: key);

  final productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chef Shop'),
        backgroundColor: Colors.black87,
        elevation: 0,
        leading: const Icon(Icons.arrow_back_ios),
        actions: [
          // IconButton(
          //   onPressed: () {},
          //   icon: const Icon(Icons.view_list_rounded),
          // ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
        child: Obx(() {
          return productController.productList.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                  ),
                  itemBuilder: (context, index) {
                    return ProductTile(
                      product: productController.productList[index],
                    );
                  },
                  itemCount: productController.productList.length,
                );
        }),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Obx(() {
          return Text(
            'Items: ${productController.count}',
            style: const TextStyle(fontSize: 20),
          );
        }),
        icon: const Icon(Icons.add_shopping_cart_rounded),
        backgroundColor: Colors.redAccent,
      ),
    );
  }
}
