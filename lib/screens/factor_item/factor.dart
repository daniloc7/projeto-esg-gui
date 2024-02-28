// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:projeto/providers/indicator_provider.dart';
import 'package:projeto/screens/indicator_item/indicator_form.dart';

import 'package:projeto/screens/indicator_item/indicator.dart';
import 'package:projeto/utils/first_populate.dart';
import 'package:provider/provider.dart';

import '../../models/factor_model.dart';
import '../../models/indicator_model.dart';
import '../../utils/get_color_checkbox.dart';

// List<IndicatorModel> indicators = [
//   IndicatorModel(
//       id: "0",
//       fkIdFactor: '1',
//       name: 'Indicador 1',
//       description: 'first',
//       essential: false,
//       weight: 0.1,
//       isMarked: false),
//   IndicatorModel(
//       id: "1",
//       fkIdFactor: '1',
//       name: 'Indicador 2',
//       description: 'first',
//       essential: false,
//       weight: 0.1,
//       isMarked: false),
//   IndicatorModel(
//       id: "2",
//       fkIdFactor: '1',
//       name: 'Indicador 3',
//       description: 'first',
//       essential: false,
//       weight: 0.1,
//       isMarked: false)
// ];

class Factor extends StatefulWidget {
  final FactorModel factorModel;

  const Factor({Key? key, required this.factorModel}) : super(key: key);

  @override
  State<Factor> createState() => _FactorState();
}

class _FactorState extends State<Factor> {
  List<IndicatorModel> _indicatorModelList = [];
  List<Indicator> visualIndicators = [];
  IndicatorProvider _indicatorProvider = IndicatorProvider();

  void init() async {
    // IndicatorModel indicator1 = IndicatorModel(
    //     fkIdFactor: widget.factorModel.id.toString(),
    //     name: 'Indicator1',
    //     weight: 0);
    // IndicatorModel indicator2 = IndicatorModel(
    //     fkIdFactor: widget.factorModel.id.toString(),
    //     name: 'Indicator2',
    //     weight: 0);
    // IndicatorModel indicator3 = IndicatorModel(
    //     fkIdFactor: widget.factorModel.id.toString(),
    //     name: 'Indicator3',
    //     weight: 0);

    // await _indicatorProvider.addOne('indicators', indicator1.toJson());

    await _indicatorProvider.getAll('indicators',
        fkIdFactor: widget.factorModel.id);
    _indicatorModelList = _indicatorProvider.indicatorModelList;

    print('Indicator lenght:' + _indicatorModelList.length.toString());

    //visual (preciso iterar de acordo com o IndicatorModel)
    visualIndicators = _indicatorModelList.map((indicator) {
      return Indicator(
        indicatorModel: indicator,
      );
    }).toList();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _indicatorProvider = Provider.of<IndicatorProvider>(context, listen: false);
    init();
    // Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.01),
      // margin: const EdgeInsets.only(left: 25),
      height: MediaQuery.of(context).size.height * 0.42,
      width: MediaQuery.of(context).size.width * 0.25,
      child: Consumer<IndicatorProvider>(
        builder: (context, indicatorProvider, _) {
          return Card(
            color: widget.factorModel.isSelected
                ? Colors.lightGreen
                : Colors.white,
            elevation: widget.factorModel.isSelected ? 0 : 4,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: Text(widget.factorModel.name),
                        trailing: Checkbox(
                          fillColor:
                              MaterialStateProperty.resolveWith(getColor),
                          onChanged: (bool? value) {
                            setState(() {
                              widget.factorModel.isMarked = value!;
                              // print(widget.factorModel.isMarked);
                              // print(widget.factorModel.id);
                            });
                          },
                          value: widget.factorModel.isMarked,
                        ),
                      ),
                    ),
                    PopupMenuButton<String>(
                      icon: const Icon(Icons.more_vert),
                      onSelected: (String value) {
                        if (value == 'editar') {
                          // Lógica para a ação de editar
                        } else if (value == 'excluir') {
                          // Lógica para a ação de excluir
                        }
                      },
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<String>>[
                        const PopupMenuItem<String>(
                          value: 'editar',
                          child: Text('Editar'),
                        ),
                        const PopupMenuItem<String>(
                          value: 'excluir',
                          child: Text('Excluir'),
                        ),
                      ],
                    ),
                    // const CustomIconButton(
                    //     icon: Icons.edit, color: Color.fromARGB(255, 222, 201, 14)),
                    // const CustomIconButton(icon: Icons.delete, color: Colors.red),
                  ],
                ),
                SizedBox(
                  child: Center(
                    child: Text(
                        "Indicadores marcados: ${widget.factorModel.markedIndicators} de ${widget.factorModel.totalIndicators}"),
                  ),
                ),
                SizedBox(
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(20.0),
                  //   color: Colors.greenAccent,
                  //   border: Border.all(),
                  // ),
                  // height: 150,
                  height: MediaQuery.of(context).size.height * 0.25,

                  child: ListView.builder(
                    itemCount: visualIndicators.length,
                    itemBuilder: (context, index) {
                      return visualIndicators[index];
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    // CustomIconButton(
                    //   icon: Icons.delete,
                    //   color: Colors.red,
                    //   onPressed: () {
                    //     setState(() {
                    //       visualIndicators
                    //           .remove(visualIndicators[widget.factorModel.id]);
                    //     });
                    //   },
                    // ),
                    IndicatorForm(),
                    // createButton('novo indicador', context, '/indicator_form'),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
