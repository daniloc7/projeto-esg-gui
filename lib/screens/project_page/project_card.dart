// ignore_for_file: must_be_immutable

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:projeto/enums/project_status.dart';
import 'package:projeto/models/project_model.dart';
import 'package:projeto/providers/project_provider.dart';
import 'package:provider/provider.dart';

class ProjectCard extends StatefulWidget {
  // late ProjectModel project;
  final String name;
  late String? description;
  final DateTime initDate;
  late ProjectStatus? status;
  late double? score;

  ProjectCard(
      {super.key,
      // required this.project,
      required this.name,
      this.description,
      required this.initDate,
      this.status,
      this.score});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

//tenho q instanciar um projectModel aqui para usar o projectProvider
class _ProjectCardState extends State<ProjectCard> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProjectProvider>(
      builder: (context, value, child) {
        return SizedBox(
          // decoration: BoxDecoration(
          //   border: Border.all(),
          //   borderRadius: BorderRadius.circular(15.0),
          // ),
          width: 300,
          height: 280,
          child: Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            //achar metodo para implementar porcentagem do score
            child: Column(
              children: [
                ListTile(
                  title: Text(widget.name),
                  hoverColor: Colors.white,
                  // subtitle: Text(
                  //   style: const TextStyle(color: Colors.blue),
                  // ),
                  trailing: SizedBox(
                    width: 30,
                    child: PieChart(
                      PieChartData(
                        sections: [
                          PieChartSectionData(
                            value: widget.score,
                            color: Colors.blue,
                            title: '${widget.score?.toStringAsFixed(2)}%',
                            radius: 15,
                            titlePositionPercentageOffset: -1.35,
                            titleStyle: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          PieChartSectionData(
                              value: 100 - widget.score!,
                              color: Colors.grey[300]!,
                              radius: 15,
                              showTitle: false),
                        ],
                        sectionsSpace: 0,
                        centerSpaceRadius: 0,
                        startDegreeOffset: -90,
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    // border: Border(
                    //   bottom: BorderSide(
                    //     color: Colors.black, // Cor da linha escura
                    //     width: 1.0, // Largura da linha
                    //   ),
                  ),
                  height: 165,
                  child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYf6uUYcGcQ8e9neDNRXMUUXzmUPuUJtel5g&usqp=CAU',
                    fit: BoxFit.cover,
                    // fit: BoxFit.cover,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      } else {
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      }
                    },
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return const Center(
                        child: Text('Erro ao carregar a imagem'),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  // decoration: const BoxDecoration(
                  //   border: Border(
                  //     top: BorderSide(
                  //       color: Colors.black, // Cor da linha escura
                  //       width: 1.0, // Largura da linha
                  //     ),
                  //   ),
                  // ),
                  child: ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Excluir",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text("Ver mais"),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text("Acessar"),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
