import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projeto/models/score_model.dart';

class ScoreController2 {
  List<ScoreModel> scoreList = [];
  final FirebaseFirestore databaseReference = FirebaseFirestore.instance;

  // Future<void> addScore(String id, String name, String weight) {
  //   return databaseReference.collection('scores').add({
  //     "id": id,
  //     "name": name,
  //     "weight": weight,
  //   });
  // }

  //projects[name]/scores/{name:factor1}[dados]/{name:indicator[dados]}
  //projects/score1{weight, ismarked, factor{
  //}},score2

  static Future addScore(String id, String name, double weight) async {
    // return FirebaseFirestore.instance.collection('scores').
    // return FirebaseFirestore.instance
    //     .collection('scores')
    //     .doc("/woLaul3Aj1dAQrIAXRtH")
    //     .get();
    return FirebaseFirestore.instance.collection('scores').add({
      "id": id,
      "name": name,
      "weight": weight,
      // "factor1": {'weight': 0.5}
    });
  }

  static Future getScore(String id) {
    return FirebaseFirestore.instance.collection('scores').doc(id).get();
    // return FirebaseFirestore.instance.collection('scores/$id').get();
  }

  Future getAll() {
    // return FirebaseFirestore.instance.collection('scores').snapshots();
    return FirebaseFirestore.instance.collection('scores').get().then(
      (querySnapshot) {
        for (var docSnapshot in querySnapshot.docs) {
          scoreList.add(ScoreModel.fromJson(docSnapshot.data()));
          // score.add(docSnapshot.)
          // att.;
          // print('id' + att.id);
          // print('name' + att.name);
          // print('weight' + att.weight.toString());
          // print('${docSnapshot.id} => ${docSnapshot.data()}');
        }
        print(scoreList.first.name);
      },
      onError: (e) => print("Erro para buscar os elementos: $e"),
    );
  }
}
