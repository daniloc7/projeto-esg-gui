import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:projeto/enums/project_status.dart';

class ProjectCard extends StatelessWidget {
  final String name;
  final String description;
  final DateTime initDate;
  final ProjectStatus status;
  final double score;

  const ProjectCard(
      {super.key,
      required this.name,
      required this.description,
      required this.initDate,
      required this.status,
      required this.score});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      width: 300,
      height: 300,
      child: Card(
        elevation: 4.0,
        // shape: ,
        //achar metodo para implementar porcentagem do score
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black, // Cor da linha escura
                    width: 1.0, // Largura da linha
                  ),
                ),
              ),
              child: ListTile(
                title: Text(name),
                hoverColor: Colors.grey,
                subtitle: Text(
                  status.name,
                  style: const TextStyle(color: Colors.blue),
                ),
                trailing: SizedBox(
                  width: 30,
                  child: PieChart(
                    PieChartData(
                      sections: [
                        PieChartSectionData(
                          value: score,
                          color: Colors.blue,
                          title: '${score.toStringAsFixed(2)}%',
                          radius: 15,
                          titlePositionPercentageOffset: -1.35,
                          titleStyle: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        PieChartSectionData(
                            value: 100 - score,
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
            SizedBox(
              height: 165,
              child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYf6uUYcGcQ8e9neDNRXMUUXzmUPuUJtel5g&usqp=CAU',
                fit: BoxFit.cover,
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
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.black, // Cor da linha escura
                    width: 1.0, // Largura da linha
                  ),
                ),
              ),
              child: ButtonBar(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 80),
                    // margin: EdgeInsets.only(
                    //     right: MediaQuery.of(context).size.width * 0.2),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.delete),
                        color: Colors.red),
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
  }
}
