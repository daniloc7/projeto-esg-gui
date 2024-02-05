import 'package:flutter/material.dart';
import 'package:projeto/controllers/factor_controller.dart';
import 'package:projeto/controllers/project_controller.dart';
import 'package:projeto/controllers/score_controller.dart';
import 'package:projeto/screens/project_page/project_card.dart';

import '../../enums/project_status.dart';

void instaFactor() async {
  ProjectController projectController = ProjectController();
  ScoreController scoreController = ScoreController();
  FactorController factorController = FactorController();
  //posso transformar um model utilizando um toJson para passar por parametro
  Map<String, dynamic> projectData = {'name': 'teste', 'weight': 50};
  projectController.addOne('projects', projectData);
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
        appBar:
            AppBar(toolbarHeight: MediaQuery.of(context).size.height * 0.01),
        body: body());
  }

  Widget body() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                  spacing: 50, //coluna
                  runSpacing: 40, //linha
                  children: [
                    ProjectCard(
                        name: "Projeto 1",
                        description: "descricao",
                        initDate: DateTime.now(),
                        status: ProjectStatus.iniciado,
                        score: 5.5),
                    ProjectCard(
                        name: "Projeto 2",
                        description: "descricao",
                        initDate: DateTime.now(),
                        status: ProjectStatus.iniciado,
                        score: 5.5),
                    ProjectCard(
                        name: "Projeto 3",
                        description: "descricao",
                        initDate: DateTime.now(),
                        status: ProjectStatus.iniciado,
                        score: 5.5),
                    ProjectCard(
                        name: "Projeto 4",
                        description: "descricao",
                        initDate: DateTime.now(),
                        status: ProjectStatus.iniciado,
                        score: 5.5),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
