import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:graduated_project/Widgets_store/custom_stack.dart';
import 'package:graduated_project/models_store/product_model.dart';
import 'package:graduated_project/services_store/get_all_product_service.dart';

class HomePageStore extends StatelessWidget {
  HomePageStore();

  static String id = 'Home Page store';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white24,
        title: Text('Online Pharmasy'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Icon(
              Icons.local_pharmacy,
              size: 30,
            ),
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
