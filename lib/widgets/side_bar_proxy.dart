// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';

import 'custom_list_tile.dart';

class SideBar extends StatefulWidget {
  bool showColumn = false;
  SideBar({
    Key? key,
    required this.showColumn,
  }) : super(key: key);

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MouseRegion(
          onHover: (event) {
            print('teste');

            setState(() {
              widget.showColumn =
                  event.position.dx <= 50.0 || event.position.dy <= 50.0;
            });
          },
          child: widget.showColumn ? _buildColumn() : Container(),
        ),
      ],
    );
  }

  Widget _buildColumn() {
    return Column(children: [
      CustomListTile(
        icon: Icons.dashboard,
        text: "Início",
        onTap: () {
          Navigator.of(context).pushNamed('routeName');
        },
      ),
      CustomListTile(
        icon: Icons.dashboard,
        text: "Projetos",
        onTap: () {
          Navigator.of(context).pushNamed('routeName');
        },
      )
    ]);
  }
}
