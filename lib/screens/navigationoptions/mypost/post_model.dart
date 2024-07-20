import 'dart:io';

class Post {
  final String title;
  final DateTime date;
  final File image;

  Post({
    required this.title,
    required this.date,
    required this.image,
  });

  static fromJson(decode) {}
}
