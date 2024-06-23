import 'package:flutter/material.dart';
import 'package:graduated_project/News/categories/wep_view_container.dart';
import 'package:graduated_project/News/classes/articles_model.dart';

class news_tile extends StatelessWidget {
  news_tile({
    super.key,
    required this.articleModel,
  });
  final Articles_model articleModel;
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        //   return wepViewContainer(
        //     category: articleModel.url,
        //   );
        // }));
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 22.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Column(
            children: [
              articleModel.image != null
                  ? Image.network(articleModel.image!)
                  : Image.asset("Assets/icons/heart.png"),
              Text(
                articleModel.title,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              Text(
                articleModel.supTitle ?? "",
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(color: Colors.grey, fontSize: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
