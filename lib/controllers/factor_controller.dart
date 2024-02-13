import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projeto/interfaces/database_interface.dart';
import 'package:projeto/models/factor_model.dart';

class FactorController implements DatabaseInterface {
  late FirebaseFirestore databaseReference = FirebaseFirestore.instance;
  final List<FactorModel> _factorList = [];
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

  // await databaseReference.collection("$collection/$parent/factors").add(data);
  @override
  Future<bool> addOne(String collection, Map<String, dynamic> data,
      {String? parent = ''}) async {
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
  Future getAll(String collection, {String? fkIdScore}) {
    return FirebaseFirestore.instance.collection(collection).get().then(
      (querySnapshot) {
        for (var docSnapshot in querySnapshot.docs) {
          if ((docSnapshot.data().containsValue(fkIdScore))) {
            _factorList.add(FactorModel.fromJson(docSnapshot.data()));
          }
        }
        return _factorList;
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
      return FactorModel.fromJson(data.data() as Map<String, dynamic>);
    } catch (e) {
      print(e.toString());
    }
  }

  // getTotalFactorsByScore(String fkIdScore){}
  // getTotalWeightByScore(String fkIdScore){}
}
