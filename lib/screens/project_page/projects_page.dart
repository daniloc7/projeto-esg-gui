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

import '../../enums/project_status.dart';

List<ProjectModel> projects = [];

void instaFactor() async {
  ProjectProvider projectProvider = ProjectProvider();
  // ScoreController scoreController = ScoreController();
  // FactorController factorController = FactorController();
  //posso transformar um model utilizando um toJson para passar por parametro
  Map<String, dynamic> projectData = {
    'name': 'Projeto A',
    'description': 'Projeto Teste',
    'initDate': DateTime.now(),
    'score': 0
  };

  // projectProvider.addOne('projects', projectData);
  await projectProvider.getAll('projects');
  projects = projectProvider.projectList;

  // Map<String, dynamic> scoreData = {
  //   'id': '0',
  //   'name': 'testeScore',
  //   'weight': 50
  // };
  // scoreController.addOne('projects', scoreData, parent: 'yfKi0VxhzIYZyq1yr032');

  // DocumentSnapshot result =
  //     await ScoreController.getScore('woLaul3Aj1dAQrIAXRtH');
  // await ScoreController.addScore('0', 'teste', 0.5);
  // print(result.first.);
  // await FactorController.addFactor('ujBBRP3bN45BjrLypYKs', 'teste', 0.5);
  // print(result.data().toString());
  // ScoreModel scoreModel = ScoreController.getScore('0') as ScoreModel;
  // await FactorController.addFactor(scoreModel, 'fator1', 0.5);
}

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  @override
  void initState() {
    super.initState();
    instaFactor();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: MediaQuery.of(context).size.height * 0.01),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: projects.length,
            itemBuilder: (context, index) {
              ProjectModel pm = projects.elementAt(index);
              return Wrap(
                spacing: 50, //coluna
                runSpacing: 40, //linha
                children: [
                  ProjectCard(
                    project: pm,
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  // Widget body() {
  //   return SingleChildScrollView(
  //     scrollDirection: Axis.vertical,
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.stretch,
  //       children: [
  //         Center(
  //           child: Padding(
  //             padding: const EdgeInsets.all(8.0),
  //             child: Wrap(
  //                 spacing: 50, //coluna
  //                 runSpacing: 40, //linha
  //                 children: [
  //                   FutureBuilder(future: projectProvider().getAll('projects'), builder: (BuildContext context))
  //                 ]),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
