// import 'package:cross_scroll/cross_scroll.dart';
// import 'package:flutter/material.dart';
// import 'package:projeto/widgets/score.dart';

// class ScorePage extends StatefulWidget {
//   const ScorePage({super.key});

//   @override
//   State<ScorePage> createState() => _ScorePageState();
// }

// class _ScorePageState extends State<ScorePage> {
//   bool _showSideBar = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar:
//             AppBar(toolbarHeight: MediaQuery.of(context).size.height * 0.01),
//         body: Row(
//           children: [
//             MouseRegion(
//               onHover: (event) {
//                 setState(() {
//                   _showSideBar =
//                       event.position.dx <= 50.0 || event.position.dy <= 50.0;
//                 });
//               },
//               child: _showSideBar ? _buildColumn() : Container(),
//             ),
//             Column(
//               children: const [
//                 Score(name: 'Inovação aberta'),
//                 Score(name: 'Sustentabilidade'),
//               ],
//             ),
//           ],
//         ));
//   }

//   Widget _buildColumn() {
//     return Column(
//       children: <Widget>[
//         Text('Olá, mundo!'),
//         // Adicione mais widgets à sua coluna aqui
//       ],
//     );
//   }
// }

import 'package:cross_scroll/cross_scroll.dart';
import 'package:flutter/material.dart';
import 'package:projeto/utils/pallete.dart';
import 'package:projeto/widgets/custom_button.dart';
import 'package:projeto/widgets/score.dart';

import '../widgets/custom_list_tile.dart';

class ScorePage extends StatefulWidget {
  const ScorePage({super.key});

  @override
  State<ScorePage> createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  bool _showSideBar = false;

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
              Column(
                children: [
                  const Score(name: 'Inovação aberta'),
                  const Score(name: 'Sustentabilidade'),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.8),
                      child: CustomButton(name: 'Finalizar')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

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
