import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:untitled/models/articles.dart';

class ArticleApi{
  // static const String ArticleUrl = 'http://10.0.2.2:3000/api/data'; //emulator link
  static const String ArticleUrl = 'http://13.235.134.22:3000/api/data'; 
//  static const String ArticleUrl = 'http://localhost:3000/api/data';
  static Future<List<Article>> fetchArticle() async {
    final response = await http.get(Uri.parse(ArticleUrl));

    if (response.statusCode == 200) {
      Iterable list = jsonDecode(response.body);
      List<Article> articles =
      List<Article>.from(list.map((model) => Article.fromJson(model)));

      return articles;
    } else {
      throw Exception('Failed to load articles');
    }
  }
}


