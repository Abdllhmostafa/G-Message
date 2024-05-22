import 'package:flutter/material.dart';
import 'package:graduated_project/Widgets_store/custom_stack.dart';
import 'package:graduated_project/models_store/product_model.dart';
import 'package:graduated_project/store_views/cart_view.dart';
import 'package:graduated_project/services_store/get_all_product_service.dart';

class HomePage extends StatelessWidget {
  HomePage();

  static String id = 'Home Page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trending'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    CartView.id,
                  );
                },
                child: Icon(size: 25, Icons.shopping_cart)),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 40),
        child: FutureBuilder<List<ProductModel>>(
          future: AllProductService().getAllProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // While data is being fetched, show a loading indicator
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              // If there's an error in fetching data, show an error message
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              List<ProductModel> products = snapshot.data!;
              // If data is fetched successfully, display the GridView
              return GridView.builder(
                clipBehavior: Clip.none,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 40,
                ),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  // Access the product data from the snapshot

                  // Now you can use the product data to build your UI
                  return CustomStack(
                    product: products[index],
                    // Pass the product data to CustomStack
                  );
                },
              );
            } else {
              // If there's no data available, show a message
              return Center(child: Text('No data available'));
            }
          },
        ),
      ),
    );
  }
}
