import 'package:flutter/material.dart';

class ContainerCard extends StatelessWidget {
  final Color colour;
  final Widget? containerChild;
  final Function? gestureFunction;
  const ContainerCard(
      {Key? key,
      required this.colour,
      this.containerChild,
      this.gestureFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        gestureFunction!();
      }),
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: containerChild,
      ),
    );
  }
}
