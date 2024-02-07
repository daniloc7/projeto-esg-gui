abstract class ProviderInterface {
  Future addOne(String collection, Map<String, dynamic> data, {String? parent});
  Future<bool> add(String collection, List<Map<String, dynamic>> data);
  Future getOne(String collection, String doc);
  Future getAll(String collection);
  // Future<DocumentSnapshot<Map<String, dynamic>>> getAll(String collection);
  Future delete(String collection, String doc, String id);
  // Future<bool> deleteAll(String collection);
  Future getByT();
}
