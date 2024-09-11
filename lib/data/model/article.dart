import 'package:news_app/data/model/source.dart';

class Article {
  final Source? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;
  const Article(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});
  Article copyWith(
      {Source? source,
      String? author,
      String? title,
      String? description,
      String? url,
      String? urlToImage,
      String? publishedAt,
      String? content}) {
    return Article(
        source: source ?? this.source,
        author: author ?? this.author,
        title: title ?? this.title,
        description: description ?? this.description,
        url: url ?? this.url,
        urlToImage: urlToImage ?? this.urlToImage,
        publishedAt: publishedAt ?? this.publishedAt,
        content: content ?? this.content);
  }

  Map<String, Object?> toJson() {
    return {
      'source': source?.toJson(),
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
      'content': content
    };
  }

  static Article fromJson(Map<String, Object?> json) {
    return Article(
        source: json['source'] == null
            ? null
            : Source.fromJson(json['source'] as Map<String, Object?>),
        author: json['author'] == null ? null : json['author'] as String,
        title: json['title'] == null ? null : json['title'] as String,
        description:
            json['description'] == null ? null : json['description'] as String,
        url: json['url'] == null ? null : json['url'] as String,
        urlToImage:
            json['urlToImage'] == null ? null : json['urlToImage'] as String,
        publishedAt:
            json['publishedAt'] == null ? null : json['publishedAt'] as String,
        content: json['content'] == null ? null : json['content'] as String);
  }

  @override
  String toString() {
    return '''Article(
                source:${source.toString()},
author:$author,
title:$title,
description:$description,
url:$url,
urlToImage:$urlToImage,
publishedAt:$publishedAt,
content:$content
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Article &&
        other.runtimeType == runtimeType &&
        other.source == source &&
        other.author == author &&
        other.title == title &&
        other.description == description &&
        other.url == url &&
        other.urlToImage == urlToImage &&
        other.publishedAt == publishedAt &&
        other.content == content;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, source, author, title, description, url,
        urlToImage, publishedAt, content);
  }
}
