import 'package:flutter/foundation.dart';
import 'package:projeto/controllers/factor_controller.dart';
import 'package:projeto/interfaces/provider_interface.dart';

import '../models/factor_model.dart';

class FactorProvider extends ChangeNotifier implements ProviderInterface {
  List<FactorModel> _factorModelList = [];
  late FactorModel _factorModel;
  FactorController _factorController = FactorController();

  List<FactorModel> get factorModelList => _factorModelList;
  @override
  Future<bool> add(String collection, List<Map<String, dynamic>> data) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  Future addOne(String collection, Map<String, dynamic> data,
      {String? parent}) async {
    await _factorController.addOne(collection, data);
    notifyListeners();
  }

  @override
  Future<bool> delete(String collection, String doc, String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future getAll(String collection, {String? fkIdScore}) async {
    _factorModelList.clear();
    _factorModelList =
        await _factorController.getAll(collection, fkIdScore: fkIdScore);
    notifyListeners();
  }

  @override
  Future getByT() {
    // TODO: implement getByT
    throw UnimplementedError();
  }

  Future setIsSelected(String doc) async {
    await _factorController.setIsSelected(doc);
    notifyListeners();
  }

  @override
  Future getOne(String collection, String doc) async {
    _factorModel = await _factorController.getOne(collection, doc);
  }
}
