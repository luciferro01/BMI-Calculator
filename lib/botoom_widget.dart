import 'package:flutter/material.dart';
import 'constants.dart';

class BottomWidget extends StatelessWidget {
  final String bottomText;
  final VoidCallback onTap;
  const BottomWidget({Key? key, required this.bottomText, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: bottomContainerColour,
        // padding: const EdgeInsets.all(25),
        height: 80,
        width: double.infinity,
        child: Center(
          child: Text(
            bottomText,
            style: const TextStyle(
              fontSize: 30,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            // textDirection: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
