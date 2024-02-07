import 'package:flutter/foundation.dart';
import 'package:projeto/interfaces/database_interface.dart';

class FactorProvider extends ChangeNotifier implements DatabaseInterface {
  @override
  Future<bool> add(String collection, List<Map<String, dynamic>> data) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  Future<bool> addOne(String collection, Map<String, dynamic> data,
      {String? parent}) {
    // TODO: implement addOne
    throw UnimplementedError();
  }

  @override
  Future<bool> delete(String collection, String doc, String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future getAll(String collection) {
    // TODO: implement getAll
    throw UnimplementedError();
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
