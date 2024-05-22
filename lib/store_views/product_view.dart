import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:graduated_project/Widgets_store/custom_button.dart';
import 'package:graduated_project/models_store/product_model.dart';
import 'package:graduated_project/store_views/cart_view.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});
  static String id = 'product view';
  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, CartView.id,
                        arguments: product);
                  },
                  child: Icon(size: 25, Icons.shopping_cart)),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Center(
                      child: Image.network(
                          height: 100, width: 100, product.image)),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.title.substring(0, 10),
                        style: TextStyle(fontSize: 20),
                      ),
                      Column(
                        children: [
                          Text(
                            "Price",
                            style: TextStyle(fontSize: 18),
                          ),
                          Row(
                            children: [
                              Text(r"$"),
                              Text(product.price.toString()),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Descreption",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          product.description,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, CartView.id,
                              arguments: product);
                        },
                        child: Icon(size: 35, Icons.shopping_cart)),
                    CustomButton(text: 'Add To Cart')
                  ],
                )
              ]),
        ));
  }
}
