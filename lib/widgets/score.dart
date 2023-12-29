import 'package:flutter/material.dart';

import '../models/factor_model.dart';
import 'factor.dart';

List<FactorModel> factors = [
  FactorModel(
    id: 0,
    weight: 0.5,
    name: 'Fator 1',
    markedIndicators: 15,
    totalIndicators: 20,
  ),
  FactorModel(
    id: 1,
    name: 'Fator 2',
    markedIndicators: 15,
    totalIndicators: 20,
    weight: 0.5,
  ),
  FactorModel(
    id: 2,
    weight: .3,
    name: 'Fator 3',
    markedIndicators: 15,
    totalIndicators: 20,
  ),
];

List<Factor> visualFactores = [
  Factor(factorModel: factors[0]),
  Factor(factorModel: factors[1]),
  Factor(factorModel: factors[2])
];

class Score extends StatefulWidget {
  final String name;
  const Score({super.key, required this.name});

  @override
  State<Score> createState() => _ScoreState();
}

class _ScoreState extends State<Score> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.05,
          MediaQuery.of(context).size.height * 0.02, 0, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: Colors.black, // Cor da borda
          width: 0.2, // Espessura da borda
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.height * 0.01,
                0,
                0,
                MediaQuery.of(context).size.height * 0.05),
            // padding: EdgeInsets.only(bottom: 200),
            child: Text(
              widget.name,
              style: const TextStyle(
                fontFamily: 'Roboto',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          for (final factor in visualFactores)
            DragTarget<Factor>(
              builder: (context, candidateData, rejectedData) {
                return LongPressDraggable<Factor>(
                  data: factor,
                  feedback: Opacity(
                    opacity: 0.7,
                    child: factor,
                  ),
                  childWhenDragging: factor,
                  onDragStarted: () {
                    setState(() {
                      factor.factorModel.isSelected = true;
                    });
                  },
                  onDragEnd: (details) {
                    setState(() {
                      factor.factorModel.isSelected = false;
                    });
                  },
                  onDragCompleted: () {
                    setState(() {
                      factor.factorModel.isSelected = false;
                    });
                  },
                  child: factor,
                );
              },
              onWillAccept: (data) => true,
              //preciso buscar todos os indicadores, dado um factor e mudar junto.
              onAccept: (data) {
                final draggedIndex = visualFactores.indexOf(data);
                final targetIndex = visualFactores.indexOf(factor);

                setState(() {
                  visualFactores[draggedIndex] = factor;
                  visualFactores[targetIndex] = data;
                });
              },
            ),
          IconButton(
              onPressed: () {
                setState(() {
                  visualFactores.remove(visualFactores.first);
                });
              },
              icon: const Icon(Icons.add))
        ],
      ),
    );
  }
}
