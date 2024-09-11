import 'dart:convert';

import 'package:news_app/data/model/articles_response.dart';
import 'package:news_app/data/model/sources_response.dart';
import 'package:http/http.dart' as http;

abstract class ApiManager {
  static Future<SourcesResponse> getSources(String categoryId)async{
    http.Response serverResponse = await http.get(Uri.parse('https://newsapi.org/v2/top-headlines/sources?apiKey=bf6da08eaad64c09b4bd1c14f55e4d1a&category=$categoryId'));

    if (serverResponse.statusCode >=200 && serverResponse.statusCode < 300) {
      Map<String, dynamic> json = jsonDecode(serverResponse.body) as Map<String, dynamic>;
      return SourcesResponse.fromJson(json);
    } else {
      throw Exception('Failed to load sources');
    }
  }
  static Future<ArticlesResponse> getArticles(String sourceId)async{
    http.Response serverResponse = await http.get(Uri.parse('https://newsapi.org/v2/everything?apiKey=bf6da08eaad64c09b4bd1c14f55e4d1a&sources=$sourceId'));

    if (serverResponse.statusCode >=200 && serverResponse.statusCode < 300) {
      Map<String, dynamic> json = jsonDecode(serverResponse.body) as Map<String, dynamic>;
      return ArticlesResponse.fromJson(json);
    } else {
      throw Exception('Failed to load articles');
    }
  }
}