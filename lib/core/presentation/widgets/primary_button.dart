import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.onPressed, required this.child, super.key,
  });

  final VoidCallback? onPressed;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      // style: const ButtonStyle(
      //   backgroundColor: MaterialStatePropertyAll(Colors.teal),
      // ),
      child: child,
    );
  }
}
