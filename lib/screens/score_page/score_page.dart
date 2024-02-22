import 'package:cross_scroll/cross_scroll.dart';
import 'package:flutter/material.dart';
import 'package:projeto/models/factor_model.dart';
import 'package:projeto/utils/first_populate.dart';
import 'package:projeto/utils/pallete.dart';
import 'package:projeto/widgets/custom_button.dart';
import 'package:projeto/screens/score_page/score.dart';

import '../../models/score_model.dart';
import '../../providers/score_provider.dart';
import '../../widgets/custom_list_tile.dart';

class ScorePage extends StatefulWidget {
  const ScorePage({super.key});

  @override
  State<ScorePage> createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  bool _showSideBar = false;
  bool _isEmpty = false;
  late String fkIdProject;
  final ScoreProvider _scoreProvider = ScoreProvider();

  List<ScoreModel> _scoreModelList = [];

  void init() async {
    // Map<String, dynamic> data = {
    //   'id': '01010101',
    //   'fkIdProject': '10Twm5nCKOwm6ZMgaVWe',
    //   'name': 'Sustentabilidade',
    //   'weight': 3.2,
    // };
    // FactorModel _factorModel = FactorModel(fkIdScore: fkIdScore, name: name)
    // FirstPopulate().init(F)

    await _scoreProvider.getAll('scores', fkProjectId: fkIdProject);
    _scoreModelList = _scoreProvider.scoreList;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    fkIdProject = arguments['id'];

    init();

    _scoreModelList.isEmpty ? _isEmpty = true : _isEmpty = false;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) {
        setState(() {
          _showSideBar = event.position.dx <= 100.0;
        });
      },
      child: Scaffold(
        appBar:
            AppBar(toolbarHeight: MediaQuery.of(context).size.height * 0.01),
        body: CrossScroll(
          child: Row(
            children: [
              _showSideBar ? _buildColumn() : Container(),
              // if (_isEmpty) _noData(context),
              _scoreColumn(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _noData(BuildContext context) {
    return AlertDialog(
      title: const Text('Informação'),
      content: SingleChildScrollView(
        child: ListBody(
          children: const <Widget>[
            Text(
                "Por default, é criado os scores 'Inovacao Aberta' e 'Sustentabilidade'."),
            Text('Por favor, crie novos fatores e indicadores.'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Entendi'),
          onPressed: () {
            setState(() {
              _isEmpty = false; // atualiza o estado para esconder a mensagem
            });
          },
        ),
      ],
    );
  }

  Widget _scoreColumn() {
    print('teste');
    return SafeArea(
      child: Column(
        children: <Widget>[
          ..._scoreModelList
              .map((score) => Score(
                    scoreModel: score,
                  ))
              .toList(),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(
                  margin: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.8, 0, 0, 15),
                  child: CustomButton(name: 'Finalizar')),
            ],
          ),
        ],
      ),
    );
  }
  // Widget _scoreColumn() {
  //   return Column(
  //     children: [
  //       Score(name: _scoreModelList[index].name),
  //       Score(name: 'Inovação aberta'),
  //       Score(name: 'Sustentabilidade'),
  //       const SizedBox(
  //         height: 20,
  //       ),
  //       Row(
  //         children: [
  //           Container(
  //               margin: EdgeInsets.only(
  //                   left: MediaQuery.of(context).size.width * 0.8),
  //               child: CustomButton(name: 'Finalizar')),
  //         ],
  //       ),
  //     ],
  //   );
  // }

  Widget _buildColumn() {
    return Container(
      margin:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.47),
      width: MediaQuery.of(context).size.width * 0.15,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [mycolor, Colors.green.shade700],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            child: Material(
              elevation: 5,
              child: Icon(
                Icons.person,
                color: Colors.black,
                size: 50,
              ),
            ),
          ),
          CustomListTile(
            icon: Icons.home,
            text: "Início",
            onTap: () {
              Navigator.of(context).pushNamed('routeName');
            },
          ),
          CustomListTile(
            icon: Icons.add_moderator_rounded,
            text: "Projetos",
            onTap: () {
              Navigator.of(context).pushNamed('routeName');
            },
          ),
          CustomListTile(
            icon: Icons.add_moderator_rounded,
            text: "Configurações",
            onTap: () {
              Navigator.of(context).pushNamed('routeName');
            },
          ),
          CustomListTile(
            icon: Icons.add_moderator_rounded,
            text: "Sair",
            onTap: () {
              Navigator.of(context).pushNamed('routeName');
            },
          )
        ],
      ),
    );
  }
}
