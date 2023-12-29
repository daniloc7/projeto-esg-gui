//implementar ponderacao
class Score {
  final int id;
  late String name;
  late int totalFactors;
  late double weight;
  late double score;
  late bool isAccepted;

  Score({
    required this.id,
    required this.name,
    required this.totalFactors,
    required this.weight,
    required this.score,
    required this.isAccepted,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'totalFactors': totalFactors,
      'weight': weight,
      'score': score,
      'isAccepted': isAccepted,
    };
  }

  factory Score.fromJson(Map<String, dynamic> json) {
    return Score(
      id: json['id'],
      name: json['name'],
      totalFactors: json['totalFactors'],
      weight: json['weight'],
      score: json['score'],
      isAccepted: json['isAccepted'],
    );
  }

  void setWeigting() {}

  void getWeighting() {}
}
