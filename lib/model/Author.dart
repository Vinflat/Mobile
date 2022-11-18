import 'package:json_annotation/json_annotation.dart';
part 'Author.g.dart';

@JsonSerializable()
class Author {
  String username = "";
  String password = "";

  Author(this.username, this.password);
  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);
  Map<String, dynamic> toJson() => _$AuthorToJson(this);
}
