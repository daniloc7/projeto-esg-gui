import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projeto/interfaces/database_interface.dart';
import 'package:projeto/models/indicator_model.dart';

class IndicatorController implements DatabaseInterface {
  final List<IndicatorModel> _indicatorModelList = [];
  FirebaseFirestore databaseReference = FirebaseFirestore.instance;
  @override
  Future<bool> add(String collection, List<Map<String, dynamic>> data) async {
    try {
      for (var item in data) {
        await databaseReference.collection(collection).add(item);
        // print('length data' + data.length.toString());
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
  Future getAll(String collection, {String? fkIdFactor}) {
    return FirebaseFirestore.instance.collection(collection).get().then(
      (querySnapshot) {
        for (var docSnapshot in querySnapshot.docs) {
          if (docSnapshot.data().containsValue(fkIdFactor)) {
            _indicatorModelList
                .add(IndicatorModel.fromJson(docSnapshot.data()));
          }
        }
        return _indicatorModelList;
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

  Future editIndicator(String doc, String newName, String newDescription,
      double newWeight, bool newEssential) async {
    try {
      //posso pegar primeiro o factor com o id dele, carregar, e depois mudar. (pensar)
      await databaseReference.collection('indicators').doc(doc).update(
        {
          'name': newName,
          'description': newDescription,
          'weight': newWeight,
          'essential': newEssential
        },
      );
      // final data =
      //     await databaseReference.collection(collection).doc(doc).get();
      // factor = FactorModel.fromJson(data.data()!);
      // factor.name = newName;
      // print(factor.name);
    } catch (e) {
      print(e);
    }
  }

  //
  Future<int> getTotalIndicatorsByFactor(String fkIdFactor) async {
    // List<IndicatorModel> _indicatorsFk = [];
    int total = 0;
    try {
      for (var item in _indicatorModelList) {
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
    double weightSum = 0;
    try {
      for (var item in _indicatorModelList) {
        if (item.fkIdFactor == fkIdFactor) {
          weightSum += item.weight;
        }
      }
    } catch (e) {
      print(e.toString());
    }
    return weightSum;
  }

  //aqui eu adicionei um listener para ficar detectando alteração de dados na collection
  //document é o ID do indicator, para edit é o update.....
  // Future editIndicator(String collection, String document) async {
  //   final docRef = databaseReference.collection(collection).doc(document);
  //   docRef.snapshots().listen(
  //     (event) {
  //       print("current data: ${event.data()}");
  //     },
  //     onError: (error) => print('Falhou na edição do indicator'),
  //   );
  // }
}
