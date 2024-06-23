import 'package:flutter/material.dart';
import 'package:graduated_project/News/Servises/news_sevices.dart';
import 'package:graduated_project/News/categories/NewsListView.dart';
import 'package:graduated_project/News/classes/articles_model.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({
    super.key,
    required this.category,
  });
  final String category;
  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  var future_data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    future_data = NewsSirves().getNews();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Articles_model>>(
      future: future_data,
      //initialData: InitialData,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return NewsListView(article: snapshot.data!);
        } else if (snapshot.hasError) {
          return SliverFillRemaining(
            child: Center(
              child: Text("Ooops there was an error",
                  style: TextStyle(color: Colors.grey)),
            ),
          );
        } else {
          return SliverFillRemaining(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
