import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projeto/interfaces/database_interface.dart';
import 'package:projeto/models/indicator_model.dart';

class IndicatorController implements DatabaseInterface {
  List<IndicatorModel> indicatorList = [];
  FirebaseFirestore databaseReference = FirebaseFirestore.instance;
  @override
  Future<bool> add(String collection, List<Map<String, dynamic>> data) async {
    try {
      for (var item in data) {
        await databaseReference.collection(collection).add(item);
        print('length data' + data.length.toString());
      }
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  @override
  Future<bool> addOne(String collection, Map<String, dynamic> data,
      {String? parent}) async {
    try {
      await databaseReference
          .collection(collection)
          .add(data)
          .then((DocumentReference doc) async {
        await databaseReference
            .collection(collection)
            .doc(doc.id)
            .update({"id": doc.id});
      });
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  @override
  Future<bool> delete(String collection, String doc, String id) async {
    try {
      await databaseReference.collection(collection).doc(doc).delete();
      print("documento deletado");
      return true;
    } catch (e) {
      print("Erro ao deletar: $e");
      return false;
    }
  }

  @override
  Future getAll(String collection) {
    return FirebaseFirestore.instance.collection(collection).get().then(
      (querySnapshot) {
        for (var docSnapshot in querySnapshot.docs) {
          indicatorList.add(IndicatorModel.fromJson(docSnapshot.data()));
        }
      },
      onError: (e) => print("Erro para buscar os elementos: $e"),
    );
  }

  @override
  Future getByT() {
    // TODO: implement getByT
    throw UnimplementedError();
  }

  @override
  Future getOne(String collection, String doc) async {
    try {
      final data =
          await databaseReference.collection(collection).doc(doc).get();
      return IndicatorModel.fromJson(data.data() as Map<String, dynamic>);
    } catch (e) {
      print(e.toString());
    }
  }

  //
  Future<int> getTotalIndicatorsByFactor(String fkIdFactor) async {
    // List<IndicatorModel> _indicatorsFk = [];
    int total = 0;
    try {
      for (var item in indicatorList) {
        if (item.fkIdFactor == fkIdFactor) {
          total += 1;
        }
      }
      print(total);
    } catch (e) {
      print(e.toString());
    }
    return total;
  }

  Future<double> getTotalWeightByFactor(String fkIdFactor) async {
    double totalWeight = 0;
    try {
      for (var item in indicatorList) {
        if (item.fkIdFactor == fkIdFactor) {
          totalWeight += item.weight;
        }
      }
    } catch (e) {
      print(e.toString());
    }
    return totalWeight;
  }
}
