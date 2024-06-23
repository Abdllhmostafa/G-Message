import 'package:dio/dio.dart';
import 'package:graduated_project/News/classes/articles_model.dart';

class NewsSirves {
  final Dio dio = Dio();

  Future<List<Articles_model>> getNews() async {
    try {
      final response = await dio.get(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=bbf3e829cf2a4876a50b1060c14614ae&category=health');
      Map<String, dynamic> jsonDAta = response.data;
      List<dynamic> articles = jsonDAta["articles"];
      List<Articles_model> articleList = [];

      for (var article in articles) {
        Articles_model articleModel = Articles_model(
            url: article["url"],
            image: article["urlToImage"],
            title: article["title"],
            supTitle: article['description']);

        articleList.add(articleModel);
      }
      return articleList;
    } catch (e) {
      return [];
    }
  }
}
