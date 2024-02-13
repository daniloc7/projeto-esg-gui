class IndicatorModel {
  final String? id;
  final String fkIdFactor;
  late String name;
  late String? description;
  late bool? essential;
  late double weight;
  late bool isMarked;

  IndicatorModel(
      {this.id,
      required this.fkIdFactor,
      required this.name,
      this.description = 'description',
      this.essential = false,
      required this.weight,
      this.isMarked = false});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'fkIdFactor': fkIdFactor,
      'name': name,
      'description': description,
      'essential': essential,
      'weight': weight,
      'isMarked': isMarked
    };
  }

  factory IndicatorModel.fromJson(Map<String, dynamic> json) {
    return IndicatorModel(
        id: json['id'],
        fkIdFactor: json['fkIdFactor'],
        name: json['name'],
        description: json['description'],
        essential: json['essential'],
        weight: json['weight'],
        isMarked: json['isMarked']);
  }

  void setIsMarked(bool value) {
    isMarked = value;
  }
}
