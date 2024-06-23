import 'package:flutter/material.dart';
import 'package:graduated_project/News/Home_view/categoryView.dart';
import 'package:graduated_project/News/classes/category_model.dart';

class category_card extends StatelessWidget {
  const category_card({super.key, required this.category});
  final category_model category;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return CategoryView(
            category: category.name,
          );
        }));
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0, right: 8),
        child: Container(
          height: 100,
          width: 120,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(category.image), fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(8)),
          child: Center(
              child: Text(
            category.name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          )),
        ),
      ),
    );
  }
}
