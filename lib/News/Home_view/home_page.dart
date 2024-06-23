import 'package:flutter/material.dart';
import 'package:graduated_project/News/categories/NewsListViewBuilder.dart';
import 'package:graduated_project/News/categories/category_list_view.dart';

class NewsHomePage extends StatelessWidget {
  const NewsHomePage({super.key});
  static String id = 'NewsHomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Health"),
            Text("News"),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(
          slivers: <Widget>[
            const NewsListViewBuilder(
              category: "health",
            ),
          ],
        ),
      ),
    );
  }
}
