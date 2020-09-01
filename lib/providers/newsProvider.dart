import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newwz/models/articleModel.dart';

class NewsProvider {
  List<ArticleModel> _articles = [];
  String url =
      'http://newsapi.org/v2/top-headlines?country=in&sortBy=publishedAt&apiKey=65c24f4747c94e63a56871673aa29483';

  List<ArticleModel> get articlesList {
    return [..._articles];
  }

  Future<void> fetchNews() async {
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((articleObject) {
        if (articleObject['urlToImage'] != null &&
            articleObject['description'] != null) {
          ArticleModel articleModel = ArticleModel(
              author: articleObject['author'],
              title: articleObject['title'],
              description: articleObject['description'],
              articleUrl: articleObject['url'],
              imageUrl: articleObject['urlToImage'],
              content: articleObject['content'],
              publishedAt: jsonData['publishedAt'] == null
                  ? DateTime.now()
                  : DateTime.parse(
                      jsonData['publishedAt'],
                    ));
          _articles.add(articleModel);
        }
      });
    }
  }
}
