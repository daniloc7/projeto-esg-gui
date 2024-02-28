// ignore_for_file: must_be_immutable

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projeto/models/project_model.dart';
import 'package:projeto/providers/project_provider.dart';
import 'package:provider/provider.dart';

import '../../utils/pallete.dart';

class ProjectCard extends StatefulWidget {
  late ProjectModel project;
  // final String name;
  // late String? description;
  // final DateTime initDate;
  // late ProjectStatus? status;
  // late double? score;

  ProjectCard({
    super.key,
    required this.project,
    // required this.name,
    // this.description,
    // required this.initDate,
    // this.status,
    // this.score
  });

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
          width: 250,
          height: 260,
          child: Card(
            elevation: 4.0,
            color: Colors.grey.shade100,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            //achar metodo para implementar porcentagem do score
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100, // Cor alterada para azul
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
                    ),
                  ),
                  child: ListTile(
                    title: Text(widget.project.name),
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
                              value: widget.project.score,
                              color: mycolor,
                              // color: Colors.blue,
                              title:
                                  '${widget.project.score.toStringAsFixed(2)}%',
                              radius: 15,
                              titlePositionPercentageOffset: -1.35,
                              titleStyle: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            PieChartSectionData(
                                value: 100 - widget.project.score,
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
                ),
                Container(
                  margin: const EdgeInsets.only(top: 0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    // border: Border(
                    //   bottom: BorderSide(
                    //     color: Colors.black, // Cor da linha escura
                    //     width: 1.0, // Largura da linha
                    //   ),
                  ),
                  height: 125,
                  width: 240,
                  child: SingleChildScrollView(child: showCardDescription()),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    // Cor alterada para azul
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                  child: ButtonBar(
                    alignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Excluir",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      // TextButton(
                      //   onPressed: () {},
                      //   child: const Text("Ver mais"),
                      // ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            '/score_page',
                            (Route<dynamic> route) => false,
                            arguments: {
                              'id': widget.project.id,
                            },
                          );
                        },
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

  Widget showCardDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            "Descrição:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Sem descriçãoSem descriçãoSem descriçãoSem descriçãoSem descriçãoSem descriçãoSem descriçãoSem descriçãoSem descriçãoSem descrição",
            // widget.description ?? "Sem descrição",
            style: TextStyle(color: Colors.grey[700]),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            "Pontuação:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            widget.project.score != null
                ? widget.project.score.toStringAsFixed(2)
                : "Sem pontuação",
            style: TextStyle(color: Colors.grey[700]),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            "Data de Início:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            DateFormat('dd/MM/yyyy').format(widget.project.initDate),
            style: TextStyle(color: Colors.grey[700]),
          ),
        ),
      ],
    );
  }
}
