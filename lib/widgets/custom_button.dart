// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String name;
  String? route;
  VoidCallback? function;

  CustomButton({
    super.key,
    required this.name,
    this.route = 'nada',
    this.function,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (route != 'nada') {
          Navigator.of(context).pushNamed(route.toString());
        } else {
          function;
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Colors.greenAccent,
        ),
      ),
      child: Text(
        name,
        style: const TextStyle(fontSize: 12, color: Colors.black87),
      ),
    );
  }
}
