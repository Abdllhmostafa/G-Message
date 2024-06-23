import 'package:flutter/material.dart';
import 'package:graduated_project/News/categories/news_tile.dart';
import 'package:graduated_project/News/classes/articles_model.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({
    super.key,
    required this.article,
  });

  final List<Articles_model> article;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      // ignore: non_constant_identifier_names
      delegate: SliverChildBuilderDelegate(childCount: article.length,
          (context, Index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 16.0),
          child: news_tile(
            articleModel: article[Index],
          ),
        );
      }),
    );
  }
}
