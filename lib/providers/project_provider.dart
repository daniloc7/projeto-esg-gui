import 'package:flutter/foundation.dart';
import 'package:projeto/controllers/project_controller.dart';
import 'package:projeto/interfaces/provider_interface.dart';
import 'package:projeto/models/project_model.dart';

class ProjectProvider extends ChangeNotifier implements ProviderInterface {
  late ProjectModel _projectModel;
  late List<ProjectModel> _projectModelList = [];
  //pegar todos os projetos, adicionar projeto
  ProjectController _projectController = ProjectController();

  List<ProjectModel> get projectList => _projectModelList;
  ProjectModel get projectModel => _projectModel;

  // Future<void> getProjects(String userId)

  @override
  Future<bool> add(String collection, List<Map<String, dynamic>> data) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  Future addOne(String collection, Map<String, dynamic> data,
      {String? parent}) async {
    await _projectController.addOne(collection, data);
    notifyListeners();
  }

  @override
  Future delete(String collection, String doc, String id) async {
    await _projectController.delete(collection, doc, id);
    notifyListeners();
  }

  @override
  Future getAll(String collection, {String? fkProjectId}) async {
    _projectModelList.clear();
    _projectModelList = await _projectController.getAll(collection);
    notifyListeners();
  }

  @override
  Future getByT() {
    // TODO: implement getByT
    throw UnimplementedError();
  }

  @override
  Future getOne(String collection, String doc) async {
    _projectModel = await _projectController.getOne(collection, doc);
    notifyListeners();
  }

  Future getByNameOrDescription(
      String collection, String searchTerm, List<ProjectModel> list) async {
    _projectModelList = await _projectController.getByNameOrDescription(
        collection, searchTerm, list);
    notifyListeners();
  }
}
