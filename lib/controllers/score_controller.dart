import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projeto/interfaces/database_interface.dart';
import 'package:projeto/models/score_model.dart';

class ScoreController implements DatabaseInterface {
  late FirebaseFirestore databaseReference = FirebaseFirestore.instance;
  final List<ScoreModel> _scoreList = [];

  List<ScoreModel> getScoreList() => _scoreList;

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

  //criar uma chave estrangeira relacionado com o projeto no score, exemplo: "fkIdProject" => vai buscar
  //por este atributo
  @override
  Future<bool> addOne(String collection, Map<String, dynamic> data,
      {String? parent}) async {
    //exemplo de data: Map<String, dynamic> data1 = {
    //"nome": "Teste"
    //};
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
          _scoreList.add(ScoreModel.fromJson(docSnapshot.data()));
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
      return FirebaseFirestore.instance.collection(collection).doc(doc).get();
    } catch (e) {
      print(e.toString());
    }
  }
}
