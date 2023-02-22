import 'package:flutter/material.dart';

class IncrementMatchPropertiesWidget extends StatefulWidget {
  final String title;
  final int gameProperty;
  final void Function() incrementGameProperty;
  final void Function() decrementGameProperty;
  const IncrementMatchPropertiesWidget({
    super.key,
    required this.title,
    required this.gameProperty,
    required this.incrementGameProperty,
    required this.decrementGameProperty,
  });

  @override
  State<IncrementMatchPropertiesWidget> createState() =>
      _IncrementMatchPropertiesWidgetState();
}

class _IncrementMatchPropertiesWidgetState
    extends State<IncrementMatchPropertiesWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.title),
        const Spacer(),
        Row(
          children: [
            TextButton(
              onPressed: widget.decrementGameProperty,
              child: const Icon(Icons.remove),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 5.0),
              child: Text(
                widget.gameProperty.toString(),
              ),
            ),
            TextButton(
              onPressed: widget.incrementGameProperty,
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ],
    );
  }
}
