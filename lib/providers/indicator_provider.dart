import 'package:flutter/material.dart';
import 'package:projeto/controllers/indicator_controller.dart';
import 'package:projeto/interfaces/provider_interface.dart';

import '../models/indicator_model.dart';

class IndicatorProvider extends ChangeNotifier implements ProviderInterface {
  IndicatorController _indicatorController = IndicatorController();
  List<IndicatorModel> _indicatorModelList = [];
  late IndicatorModel _indicatorModel;

  List<IndicatorModel> get indicatorModelList => _indicatorModelList;
  IndicatorModel get indicatorModel => _indicatorModel;
  @override
  Future<bool> add(String collection, List<Map<String, dynamic>> data) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  Future addOne(String collection, Map<String, dynamic> data,
      {String? parent}) async {
    await _indicatorController.addOne(collection, data);
    notifyListeners();
  }

  @override
  Future delete(String collection, String doc, String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future getAll(String collection, {String? fkIdFactor}) async {
    _indicatorModelList.clear();
    _indicatorModelList =
        await _indicatorController.getAll(collection, fkIdFactor: fkIdFactor);
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

  //tem as informações que vao mudar
  Future editIndicator(String collection, String document) async {
    //talvez pensar em retornar algo para o indicatorModel
    await _indicatorController.editIndicator(collection, document);
    notifyListeners();
  }
}
