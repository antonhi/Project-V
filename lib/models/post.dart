import 'package:projectv/models/model.dart';

class Post extends Model {

  late String id, url, type, user;
  String? title, description;

  Post({required this.id, required this.url, required this.type, required this.user, this.title, this.description});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(id: json['id'], url: json['url'], title: json['title'], description: json['description'], type: json['type'],
    user: json['user']);
  }

}