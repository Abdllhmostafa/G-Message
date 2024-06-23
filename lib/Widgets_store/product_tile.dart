import 'package:flutter/material.dart';
import 'package:graduated_project/Consts_chat/consts.dart';
import 'package:graduated_project/models_store/product_model.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({super.key});

  // Function to get the first three words followed by "..."
  String getFirstThreeWords(String text) {
    List<String> words = text.split(' ');
    if (words.length <= 3) {
      return text;
    } else {
      return words.sublist(0, 3).join(' ') + '...';
    }
  }

  String getFirstFiveWords(String text) {
    List<String> words = text.split(' ');
    if (words.length <= 3) {
      return text;
    } else {
      return words.sublist(0, 3).join(' ') + '...';
    }
  }

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 110,
        width: 300,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    product.image,
                    height: 80,
                    width: 80,
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        getFirstThreeWords(product.title),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.delete,
                        size: 30,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 4),
                      child: Text(
                        product.price.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
