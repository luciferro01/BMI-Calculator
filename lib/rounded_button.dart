import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onpressed;
  const RoundedButton({Key? key, required this.child, required this.onpressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4C4F5E),
      constraints: const BoxConstraints.tightForFinite(
        width: 56.0,
        height: 56.0,
      ),
      elevation: 6.0,
      onPressed: onpressed,
      child: child,
    );
  }
}
