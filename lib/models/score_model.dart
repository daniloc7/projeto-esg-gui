//implementar ponderacao

class ScoreModel {
  final String id;
  final String fkIdProject;
  late String name;
  late double weight;
  late double score;
  late bool isAccepted;
  // late int? totalFactors;
  // late List<FactorModel>? factorModel;

  ScoreModel({
    required this.id,
    required this.fkIdProject,
    required this.name,
    // this.totalFactors,
    this.weight = 0,
    this.score = 0,
    this.isAccepted = false,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'fkIdProject': fkIdProject,
      'name': name,
      // 'totalFactors': totalFactors,
      'weight': weight,
      'score': score,
      'isAccepted': isAccepted,
    };
  }

  factory ScoreModel.fromJson(Map<String, dynamic> json) {
    return ScoreModel(
      id: json['id'],
      fkIdProject: json['fkIdProject'],
      name: json['name'],
      // totalFactors: json['totalFactors'],
      weight: json['weight'],
      score: json['score'],
      isAccepted: json['isAccepted'],
    );
  }

  void setWeigting() {}

  void getWeighting() {}
}
