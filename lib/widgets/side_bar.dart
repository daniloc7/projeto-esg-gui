import 'package:flutter/material.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  bool _showColumn = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MouseRegion(
          onHover: (event) {
            setState(() {
              _showColumn =
                  event.position.dx <= 50.0 || event.position.dy <= 50.0;
            });
          },
          child: _showColumn ? _buildColumn() : Container(),
        ),
      ),
    );
  }

  Widget _buildColumn() {
    return Column(
      children: <Widget>[
        Text('Olá, mundo!'),
        // Adicione mais widgets à sua coluna aqui
      ],
    );
  }
}
