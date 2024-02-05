import 'package:projeto/enums/project_status.dart';

class ProjectModel {
  final String id;
  late String name;
  late String description;
  late DateTime initDate;
  DateTime? finalDate;
  ProjectStatus? status;
  late double score;

  ProjectModel({
    required this.id,
    required this.name,
    required this.description,
    required this.initDate,
    this.finalDate,
    this.status = ProjectStatus.iniciado,
    required this.score,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        initDate: json['initDate'],
        finalDate: json['finalDate'],
        status: json['status'],
        score: json['score']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'initDate': initDate,
      'finalDate': finalDate?.millisecondsSinceEpoch,
      'status': status,
      'score': score,
    };
  }
}
