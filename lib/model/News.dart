import 'NewsDetails.dart';
class News{
  List<NewsDetails> articles=new List<NewsDetails>();
  final String status;
  final int totalResults;
  News({this.articles,this.status,this.totalResults});
  factory News.fromJson(Map<String, dynamic> json) {
    return News(
        articles:(json['articles'] as List).map((i) => NewsDetails.fromJson(i)).toList(),
        status: json['status'] as String,
        totalResults: json['totalResults'] as int
    );
  }
}



