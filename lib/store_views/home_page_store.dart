import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduated_project/Consts_chat/consts.dart';
import 'package:graduated_project/Widgets_store/custom_stack.dart';
import 'package:graduated_project/booking_views/Views/doctor_search.dart';
import 'package:graduated_project/models_store/product_model.dart';
import 'package:graduated_project/services_store/get_all_product_service.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomePageStore extends StatelessWidget {
  HomePageStore();

  static String id = 'Home Page store';

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSearchBar(context, searchController),
            _buildProductGrid(),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      toolbarHeight: 80,
      automaticallyImplyLeading: false,
      backgroundColor: kPrimaryColor,
      title: Text(
        'Online \nPharmacy',
        style: GoogleFonts.inter(
          color: Colors.white,
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          letterSpacing: 1,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Icon(
            Icons.local_pharmacy,
            size: 30,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar(
      BuildContext context, TextEditingController searchController) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.06,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(),
        child: TextField(
          textAlign: TextAlign.start,
          controller: searchController,
          textInputAction: TextInputAction.none,
          obscureText: false,
          keyboardType: TextInputType.emailAddress,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            focusColor: Colors.black26,
            fillColor: Color.fromARGB(255, 247, 247, 247),
            filled: true,
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.01,
                width: MediaQuery.of(context).size.width * 0.01,
                child: GestureDetector(
                  onTap: () {
                    if (searchController.text.isNotEmpty) {
                      Navigator.pushReplacement(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child:
                              doctor_search(searchText: searchController.text),
                        ),
                      );
                    }
                  },
                  child: Image.asset(
                    'Assets/icons/search.png',
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),
            ),
            prefixIconColor: const Color.fromARGB(255, 3, 190, 150),
            label: Text("Search medicine..."),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProductGrid() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FutureBuilder<List<ProductModel>>(
        future: AllProductService().getAllProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            List<ProductModel> products = snapshot.data!;
            return GridView.builder(
              shrinkWrap:
                  true, // Ensures GridView takes up only as much space as its children
              physics:
                  NeverScrollableScrollPhysics(), // Prevents GridView from scrolling separately
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
                crossAxisSpacing: 15,
                mainAxisSpacing: 30,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return CustomStack(
                  product: products[index],
                );
              },
            );
          } else {
            return Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
