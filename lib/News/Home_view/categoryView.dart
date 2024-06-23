import 'package:flutter/material.dart';
import 'package:graduated_project/News/categories/NewsListViewBuilder.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: CustomScrollView(
          slivers: [
            NewsListViewBuilder(
              category: category,
            )
          ],
        ),
      ),
    );
  }
}
