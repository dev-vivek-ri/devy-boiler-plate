
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  User(
      {this.id,
      this.attributes,
      this.name,
      this.username,
      this.email,
      this.provider,
      this.confirmed,
      this.blocked,
      this.createdAt,
      this.updatedAt,
      });

  int? id;
  User? attributes;
  String? name;
  String? username;
  String? email;
  String? provider;
  bool? confirmed;
  bool? blocked;
  String? createdAt;
  String? updatedAt;
  

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
