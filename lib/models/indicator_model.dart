class IndicatorModel {
  final int id;
  late String name;
  late String description;
  late bool essential;
  late double weight;
  late bool isMarked;

  IndicatorModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.essential,
      required this.weight,
      this.isMarked = false});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'essential': essential,
      'weight': weight,
    };
  }

  factory IndicatorModel.fromJson(Map<String, dynamic> json) {
    return IndicatorModel(
        id: json['id'],
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
