import 'package:flutter/material.dart';

enum WheelScrollAlignment {
  left,
  right,
}

class ListOfNumbers extends StatelessWidget {
  final List<int> listOfNumbers;
  final void Function(int) handleButtonPress;
  final WheelScrollAlignment alignment;

  const ListOfNumbers(
      {super.key,
      required this.listOfNumbers,
      required this.handleButtonPress,
      this.alignment = WheelScrollAlignment.left});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 70,
      child: ListWheelScrollView(
        itemExtent: 65,
        onSelectedItemChanged: handleButtonPress,
        physics: const FixedExtentScrollPhysics(),
        offAxisFraction: alignment == WheelScrollAlignment.left ? 1.5 : -1.5,
        overAndUnderCenterOpacity: 0.4,
        children: listOfNumbers
            .map(
              (number) => Center(
                child: Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Text(
                      '$number',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
