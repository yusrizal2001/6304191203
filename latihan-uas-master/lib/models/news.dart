import 'dart:math';

class News {
  final String title;
  final String subtitle;
  final String author;
  final String seen;
  final String image;

  News({
    this.author,
    this.image,
    this.seen,
    this.subtitle,
    this.title,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
        author: json['author'] ?? "",
        image: json['image'] ?? "",
        seen: (Random().nextInt(100) + 1).toString() + 'k',
        subtitle: json['subtitle'] ?? "",
        title: json['title'] ?? "");
  }
}
