import 'package:flutter/material.dart';

class FullWidthElevatedButton extends StatelessWidget {
  final String title;
  final void Function() onPressed;

  const FullWidthElevatedButton(
      {super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: const Icon(Icons.add),
        label: Text(title),
      ),
    );
  }
}
