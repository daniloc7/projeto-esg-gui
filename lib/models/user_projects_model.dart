// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserProjectModel {
  final String id;
  final String idUser;
  final String fkIdBd;

  UserProjectModel({
    required this.id,
    required this.idUser,
    required this.fkIdBd,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'idUser': idUser,
      'fkIdBd': fkIdBd,
    };
  }

  factory UserProjectModel.fromJson(Map<String, dynamic> json) {
    return UserProjectModel(
      id: json['id'] as String,
      idUser: json['idUser'] as String,
      fkIdBd: json['fkIdBd'] as String,
    );
  }
}
