import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projeto/controllers/factor_controller.dart';
import 'package:projeto/controllers/project_controller.dart';
import 'package:projeto/controllers/score_controller.dart';
import 'package:projeto/models/project_model.dart';
import 'package:projeto/providers/project_provider.dart';
import 'package:projeto/screens/project_page/project_card.dart';
import 'package:projeto/screens/project_page/register_project.dart';
import 'package:projeto/widgets/custom_float_button.dart';
import 'package:provider/provider.dart';

import '../../enums/project_status.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  List<ProjectModel> projects = [];
  List<ProjectModel> projects2 = [];
  ProjectProvider projectProvider = ProjectProvider();
  ProjectController projectController = ProjectController();
  final TextEditingController _controller = TextEditingController();
  String searchTerm = '';
  void instaFactor() async {
    //posso transformar um model utilizando um toJson para passar por parametro
    // Map<String, dynamic> projectData = {
    //   'name': 'Projeto A',
    //   'description': 'Projeto Teste',
    //   'initDate': DateTime.now(),
    //   'score': 0,
    //   'status': ProjectStatus.iniciado
    // };
    await projectProvider.getAll('projects');
    projects = projectProvider.projectList;
    await projectProvider.getByNameOrDescription(
        'projects', 'Projeto A', projects);
    projects2 = projectProvider.projectList;
    print('projetos' + projects2.length.toString());
  }

  @override
  void initState() {
    super.initState();
    projectProvider = Provider.of<ProjectProvider>(context, listen: false);
    instaFactor();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 10),
      // appBar: AppBar(toolbarHeight: MediaQuery.of(context).size.height * 0.05),
      body: body(),
      floatingActionButton: CustomFloatButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const RegisterProjectPage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget body() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.fromLTRB(300, 100, 300, 0),
              child: Text('tes')),
          // child: searchBar()),
          Padding(
            padding: const EdgeInsets.fromLTRB(150, 40, 150, 0),
            child: SizedBox(
              // height: ,
              width: 1500,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Consumer<ProjectProvider>(
                      builder: (context, projectProvider, _) {
                        // projectProvider.getOne('projects', '0k6zvh1XCxNwHlVF9RXk');
                        // searchTerm == ''
                        //     ? projects = projectProvider.projectList
                        //     : projects = projects;
                        projects = projectProvider.projectList;

                        return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: projects.isEmpty
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : Wrap(
                                    //verificar se aq n fica melhor inkwell
                                    spacing: 50, //coluna
                                    runSpacing: 40, //linha
                                    children: projects
                                        .map((project) => ProjectCard(
                                              name: project.name,
                                              initDate: project.initDate,
                                              description: project.description,
                                              score: project.score,
                                              status: ProjectStatus.iniciado,
                                            ))
                                        .toList(),
                                  ));
                      },
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget searchBar() {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        labelText: 'Pesquisar',
        border: const OutlineInputBorder(),
        suffixIcon: IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            _controller.clear();
          },
        ),
      ),
      onSubmitted: (value) async {
        setState(() {
          _controller.text = '';
        });
        // projects = await projectProvider.getByNameOrDescription(
        //     'projects', searchTerm);
        // print('leng' + projects.length.toString());
        searchTerm = value;
      },
    );
  }
}
