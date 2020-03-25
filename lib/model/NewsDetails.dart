import 'Source.dart';
class NewsDetails{
  /*final String name;
  final String id;*/
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;
  final Source source;
  NewsDetails({/*this.name,this.id*/this.source,this.author,this.title,this.description,this.url,this.urlToImage,this.publishedAt,this.content});
  factory NewsDetails.fromJson(Map<String, dynamic> json) {
  return NewsDetails(
    author:json['author'],
    title:json['title'],
    description:json['description'],
    url:json['url'],
    urlToImage:json['urlToImage'],
    publishedAt:json['publishedAt'],
    content:json['content'],
    source:Source.fromJson(json['source']));
  }
}



