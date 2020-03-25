class Source{
  final String name;
  final String id;
  Source({this.name,this.id});
  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
        name:json['name'],
        id:json['id']);
  }
}