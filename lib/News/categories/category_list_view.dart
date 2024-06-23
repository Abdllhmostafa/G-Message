import 'package:flutter/material.dart';
import 'package:graduated_project/News/categories/category_card.dart';
import 'package:graduated_project/News/classes/category_model.dart';

class category_list_view extends StatelessWidget {
  category_list_view({
    super.key,
  });
  final List<category_model> categories = [
    category_model(image: "Assets/business.jpg", name: "business"),
    category_model(image: "Assets/general.jpg", name: "general"),
    category_model(image: "Assets/health.jpg", name: "health"),
    category_model(image: "Assets/science.jpg", name: "science"),
    category_model(image: "Assets/technology.jpg", name: "technology"),
    category_model(image: "Assets/sports.jpg", name: "sports"),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return category_card(category: categories[index]);
        },
      ),
    );
  }
}
