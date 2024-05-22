import 'package:flutter/material.dart';
import 'package:graduated_project/Widgets_store/custom_button.dart';
import 'package:graduated_project/Widgets_store/custom_text_field.dart';
import 'package:graduated_project/models_store/product_model.dart';
import 'package:graduated_project/services_store/update_product_service.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'package:http/http.dart' as http;

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({super.key});
  static String id = 'Update product page';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, price, image, desc;
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                ),
                CustomTextField(
                  onChanged: (data) {
                    productName = data;
                  },
                  hintText: 'update product name',
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  onChanged: (data) {
                    price = data;
                  },
                  textInput: TextInputType.number,
                  hintText: 'update product price',
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  onChanged: (data) {
                    image = data;
                  },
                  hintText: 'update product image',
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  onChanged: (data) {
                    desc = data;
                  },
                  hintText: 'update product desc',
                ),
                SizedBox(
                  height: 50,
                ),
                CustomButton(
                    onTap: () async {
                      isloading = true;
                      setState(() {});

                      try {
                        await UpdateProduct(product);
                        print('success');
                      } catch (e) {
                        print(e.toString());
                      }
                      isloading = false;
                      setState(() {});
                    },
                    text: 'update')
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> UpdateProduct(ProductModel product) async {
    await UpdateProductService().updateProduct(
        title: productName == null ? product.title : productName!,
        price: price == null ? product.price.toString() : price!,
        desc: desc == null ? product.description : desc!,
        image: image == null ? product.image : image!,
        id: product.id,
        category: product.category);
  }
}
