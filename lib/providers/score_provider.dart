import 'package:flutter/material.dart';
import 'package:projeto/controllers/score_controller.dart';
import 'package:projeto/interfaces/provider_interface.dart';
import 'package:projeto/models/score_model.dart';

class ScoreProvider extends ChangeNotifier implements ProviderInterface {
  late ScoreModel _scoreModel;
  List<ScoreModel> _scoreList = [];
  ScoreController _scoreController = ScoreController();

  @override
  Future<bool> add(String collection, List<Map<String, dynamic>> data) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  Future addOne(String collection, Map<String, dynamic> data,
      {String? parent}) async {
    await _scoreController.addOne(collection, data);
    notifyListeners();
  }

  @override
  Future delete(String collection, String doc, String id) async {
    await _scoreController.delete(collection, doc, id);
    notifyListeners();
  }

  @override
  Future getAll(String collection) async {
    _scoreList.clear();
    _scoreList = await _scoreController.getAll(collection);
    notifyListeners();
  }

  @override
  Future getByT() {
    // TODO: implement getByT
    throw UnimplementedError();
  }

  @override
  Future getOne(String collection, String doc) {
    // TODO: implement getOne
    throw UnimplementedError();
  }
}
