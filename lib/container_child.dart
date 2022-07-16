import 'package:flutter/material.dart';

class ContainerChild extends StatelessWidget {
  final IconData icoons;
  final String? textToDislay;
  const ContainerChild({required this.icoons, this.textToDislay});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icoons,
          color: Colors.white,
          size: 90,
        ),
        Text(
          '$textToDislay',
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
        ),
      ],
    );
  }
}
