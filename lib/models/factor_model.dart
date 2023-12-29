// ignore_for_file: public_member_api_docs, sort_constructors_first

class FactorModel {
  final int id;
  late bool isSelected;
  late bool isMarked;
  late String name;
  late int totalIndicators;
  late int markedIndicators;
  late double weight;

  FactorModel({
    required this.id,
    this.isSelected = false,
    this.isMarked = false,
    required this.name,
    required this.totalIndicators,
    required this.markedIndicators,
    required this.weight,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'isSelected': isSelected,
      'isMarked': isMarked,
      'name': name,
      'totalIndicators': totalIndicators,
      'markedIndicators': markedIndicators,
      'weight': weight,
    };
  }

  factory FactorModel.fromJson(Map<String, dynamic> json) {
    return FactorModel(
      id: json['id'],
      isSelected: json['isSelected'],
      isMarked: json['isMarked'],
      name: json['name'],
      totalIndicators: json['totalIndicators'],
      markedIndicators: json['markedIndicators'],
      weight: json['weight'],
    );
  }

  int countMarkedIndicators() {
    return 0;
  }

  int countTotalIndicators() {
    return 0;
  }

  //tenho que criar a vinculação com o indicador no novo. (no mongo -> id factor, id indicador)
  // List<IndicatorModel> getIndicatorsByFactor(int id) {
  //   return
  // }
}
