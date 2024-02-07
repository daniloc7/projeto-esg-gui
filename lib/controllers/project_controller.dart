import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projeto/interfaces/database_interface.dart';
import 'package:projeto/models/project_model.dart';

class ProjectController implements DatabaseInterface {
  late FirebaseFirestore databaseReference = FirebaseFirestore.instance;
  List<ProjectModel> projectList = [];

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

  //adicionar e depois altera para adicionar o id criado pelo firebase no projeto
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

//     db.collection("users").get().then(function(querySnapshot) {
//     querySnapshot.forEach(function(doc) {
//         var id = doc.id; // randomly generated document ID
//         var data = doc.data(); // key-value pairs from the document
//     });
// });
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
  Future getAll(String collection) async {
    return FirebaseFirestore.instance.collection(collection).get().then(
      (querySnapshot) {
        for (var docSnapshot in querySnapshot.docs) {
          projectList.add(ProjectModel.fromJson(docSnapshot.data()));
        }
        return projectList;
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

  // static Future addProject(ProjectModel project) {
  //   databaseReference.collection(collectionPath).add(data);
  // }
}
