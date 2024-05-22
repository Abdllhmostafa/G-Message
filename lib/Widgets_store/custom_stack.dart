import 'package:flutter/material.dart';
import 'package:graduated_project/models_store/product_model.dart';
import 'package:graduated_project/store_views/product_view.dart';
import 'package:graduated_project/store_views/updete_page.dart';

// ignore: must_be_immutable
class CustomStack extends StatelessWidget {
  CustomStack({
    super.key,
    required this.product,
  });
  ProductModel product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductView.id, arguments: product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
              child: Card(
            color: Colors.white,
            clipBehavior: Clip.none,
            elevation: 10,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.title.substring(0, 6)),
                      SizedBox(
                        height: 3,
                      ),
                      Row(
                        children: [
                          Text(product.price.toString()),
                        ],
                      ),
                    ],
                  ),
                  Icon(
                    Icons.favorite,
                    color: Colors.red,
                  )
                ],
              ),
            ),
          )),
          Positioned(
            left: 60,
            bottom: 65,
            child: Image.network(height: 100, width: 100, product.image),
          ),
        ],
      ),
    );
  }
}
