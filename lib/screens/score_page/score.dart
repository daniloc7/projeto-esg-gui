import 'package:flutter/material.dart';
import 'package:projeto/providers/factor_provider.dart';
import 'package:projeto/utils/first_populate.dart';
import 'package:provider/provider.dart';

import '../../models/factor_model.dart';
import '../../models/score_model.dart';
import '../factor_item/factor.dart';
import '../factor_item/factor_form.dart';

// List<FactorModel> factors = [
//   FactorModel(
//     id: "0",
//     weight: 0.5,
//     name: 'Fator 1',
//     markedIndicators: 15,
//     totalIndicators: 20,
//     fkIdScore: '1',
//   ),
//   FactorModel(
//     id: "1",
//     name: 'Fator 2',
//     markedIndicators: 15,
//     totalIndicators: 20,
//     weight: 0.5,
//     fkIdScore: '1',
//   ),
//   FactorModel(
//     id: "2",
//     weight: .3,
//     name: 'Fator 3',
//     markedIndicators: 15,
//     totalIndicators: 20,
//     fkIdScore: '1',
//   ),
// ];

// List<Factor> visualFactores = [
//   Factor(factorModel: factors[0]),
//   Factor(factorModel: factors[1]),
//   Factor(factorModel: factors[2])
// ];

class Score extends StatefulWidget {
  //pegar o id do Score quando vim para esta tela, pegar para o getAllFactorByScoreId
  final ScoreModel scoreModel;
  // final String name;
  const Score({super.key, required this.scoreModel});

  @override
  State<Score> createState() => _ScoreState();
}

class _ScoreState extends State<Score> {
  List<FactorModel> _factorModelList = [];
  List<Factor> visualFactores = [];
  FactorProvider _factorProvider = FactorProvider();

  //eu to pegando um score por vez, e trago todos os factors dele
  void init() async {
    //tenho que pegar o id do score

    // print('Score' + widget.scoreModel.id.toString());
    // FactorModel factorModel =
    //     FactorModel(fkIdScore: widget.scoreModel.id.toString(), name: 'Teste');
    // // FactorModel factorModel1 =
    // //     FactorModel(fkIdScore: widget.scoreModel.id.toString(), name: 'Teste1');
    // // FactorModel factorModel2 =
    // //     FactorModel(fkIdScore: widget.scoreModel.id.toString(), name: 'Teste');
    // await _factorProvider.addOne('factors', factorModel.toJson());
    // await _factorProvider.addOne('factors', factorModel1.toJson());
    // await FirstPopulate().init(factorModel: factorModel2);
    await _factorProvider.getAll('factors', fkIdScore: widget.scoreModel.id);
    _factorModelList = _factorProvider.factorModelList;
    _factorModelList.forEach((element) {
      print('nome' + element.fkIdScore);
    });
    print("LISTA INTEIRA:" + _factorModelList.length.toString());

    // visualFactores = _factorModelList.map((factor) {
    //   return Factor(factorModel: factor);
    // }).toList();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _factorProvider = Provider.of<FactorProvider>(context, listen: false);
    init();
  }

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
              widget.scoreModel.name,
              style: const TextStyle(
                fontFamily: 'Roboto',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          Consumer<FactorProvider>(
            builder: (context, factorProvider, _) {
              return Row(
                children: _factorModelList.map((factorModel) {
                  final factor = Factor(factorModel: factorModel);
                  return DragTarget<Factor>(
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
                    onAccept: (data) {
                      final draggedIndex =
                          _factorModelList.indexOf(data.factorModel);
                      final targetIndex =
                          _factorModelList.indexOf(factor.factorModel);

                      setState(() {
                        _factorModelList[draggedIndex] = factor.factorModel;
                        _factorModelList[targetIndex] = data.factorModel;
                      });
                    },
                  );
                }).toList(),
              );
            },
          ),

          // for (final factor in visualFactores)
          //   DragTarget<Factor>(
          //     builder: (context, candidateData, rejectedData) {
          //       return LongPressDraggable<Factor>(
          //         data: factor,
          //         feedback: Opacity(
          //           opacity: 0.7,
          //           child: factor,
          //         ),
          //         childWhenDragging: factor,
          //         onDragStarted: () {
          //           setState(() {
          //             factor.factorModel.isSelected = true;
          //           });
          //         },
          //         onDragEnd: (details) {
          //           setState(() {
          //             factor.factorModel.isSelected = false;
          //           });
          //         },
          //         onDragCompleted: () {
          //           setState(() {
          //             factor.factorModel.isSelected = false;
          //           });
          //         },
          //         child: factor,
          //       );
          //     },
          //     onWillAccept: (data) => true,
          //     //preciso buscar todos os indicadores, dado um factor e mudar junto.
          //     onAccept: (data) {
          //       final draggedIndex = visualFactores.indexOf(data);
          //       final targetIndex = visualFactores.indexOf(factor);

          //       setState(() {
          //         visualFactores[draggedIndex] = factor;
          //         visualFactores[targetIndex] = data;
          //       });
          //     },
          //   ),
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => FactorForm(
                    fkIdScore: widget.scoreModel.id,
                  ),
                );
              },
              icon: const Icon(Icons.add))
        ],
      ),
    );
  }
}
