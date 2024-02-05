import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projeto/models/factor_model.dart';
import 'package:projeto/models/score_model.dart';

class FactorController2 {
  List<FactorModel> factorModel = [];

  final FirebaseFirestore databaseReference = FirebaseFirestore.instance;

  static Future addFactor(String scoreId, String nome, double weight) async {
    return FirebaseFirestore.instance
        .collection("/scores/$scoreId/factors")
        .add({
      "name": nome,
      "weight": weight,
    });
    // return FirebaseFirestore.instance.collection("$scoreId/factors/").add({
    //   "name": nome,
    //   "weight": weight,
    // });
  }

  static Future deleleteFactor(ScoreModel score, FactorModel factor) {
    return FirebaseFirestore.instance
        .collection("${score.name}/factors")
        .doc(factor.id)
        .delete();
  }

  static Future addIndicatorToAFactor(
      ScoreModel score, FactorModel factor, String nome, double weight) {
    return FirebaseFirestore.instance
        .collection("${score.name}/${factor.name}/indicators/")
        .add({
      "name": nome,
      "weight": weight,
    });
  }

  static Future getAllIndicatorsByAFactor(
      ScoreModel score, FactorModel factor) {
    return FirebaseFirestore.instance
        .collection("${score.name}/${factor.name}/indicators")
        .get();
  }

  // static get
}
