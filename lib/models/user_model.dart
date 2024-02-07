// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:projeto/enums/user_nivel.dart';

class UserModel {
  final String id;
  final String name;
  final String email;
  final UserNivel usernivel;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.usernivel,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'usernivel': usernivel,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      usernivel: json['userNivel'],
    );
  }
}
