import 'package:flutter/material.dart';

class FullWidthElevatedButton extends StatelessWidget {
  final String title;
  final IconData? icon;
  final void Function() onPressed;

  const FullWidthElevatedButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: icon != null
          ? ElevatedButton.icon(
              onPressed: onPressed,
              icon: Icon(icon),
              label: Text(title),
            )
          : ElevatedButton(onPressed: onPressed, child: Text(title)),
    );
  }
}
