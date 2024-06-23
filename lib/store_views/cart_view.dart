import 'package:flutter/material.dart';
import 'package:graduated_project/Consts_chat/consts.dart';
import 'package:graduated_project/Widgets_store/product_tile.dart';
import 'package:graduated_project/models_store/product_model.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});
  static String id = 'Cart wiew';

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ProductTile();
        },
        itemCount: 1,
      ),
    );
  }
}
