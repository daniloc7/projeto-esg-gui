import 'package:flutter/material.dart';

class CustomFloatButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const CustomFloatButton(
      {super.key, required this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: child,
    );
  }
}
