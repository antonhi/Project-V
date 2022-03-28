import 'model.dart';

class Tag extends Model {
  String tag;
  List<String> followers;

  Tag({required this.tag, required this.followers});

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(tag: json['tag'], followers: (json['followers'] as List<dynamic>).cast<String>());
  }
}