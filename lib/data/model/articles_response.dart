import 'package:news_app/data/model/article.dart';

class ArticlesResponse {
  final String? status;
  final int? totalResults;
  final List<Article>? articles;
  const ArticlesResponse({this.status, this.totalResults, this.articles});
  ArticlesResponse copyWith(
      {String? status, int? totalResults, List<Article>? articles}) {
    return ArticlesResponse(
        status: status ?? this.status,
        totalResults: totalResults ?? this.totalResults,
        articles: articles ?? this.articles);
  }

  Map<String, Object?> toJson() {
    return {
      'status': status,
      'totalResults': totalResults,
      'articles':
          articles?.map<Map<String, dynamic>>((data) => data.toJson()).toList()
    };
  }

  static ArticlesResponse fromJson(Map<String, Object?> json) {
    return ArticlesResponse(
        status: json['status'] == null ? null : json['status'] as String,
        totalResults:
            json['totalResults'] == null ? null : json['totalResults'] as int,
        articles: json['articles'] == null
            ? null
            : (json['articles'] as List)
                .map<Article>(
                    (data) => Article.fromJson(data as Map<String, Object?>))
                .toList());
  }

  @override
  String toString() {
    return '''ArticlesResponse(
                status:$status,
totalResults:$totalResults,
articles:${articles.toString()}
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is ArticlesResponse &&
        other.runtimeType == runtimeType &&
        other.status == status &&
        other.totalResults == totalResults &&
        other.articles == articles;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, status, totalResults, articles);
  }
}

