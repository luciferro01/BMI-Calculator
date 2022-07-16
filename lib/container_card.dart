import 'package:flutter/material.dart';

class ContainerCard extends StatelessWidget {
  final Color colour;
  final Widget? containerChild;
  ContainerCard({required this.colour, this.containerChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: containerChild,
    );
  }
}
