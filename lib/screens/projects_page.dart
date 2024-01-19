import 'package:flutter/material.dart';
import 'package:projeto/widgets/project_card.dart';

import '../enums/project_status.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

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
