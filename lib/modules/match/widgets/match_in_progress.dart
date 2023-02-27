import 'package:billiard_score_app/modules/match/model/match.dart';
import 'package:billiard_score_app/modules/match/widgets/list_of_numbers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MatchInProgress extends HookConsumerWidget {
  final void Function(int) handleSetFirstPlayerScore;
  final void Function(int) handleSetSecondPlayerScore;
  final MatchModel latestMatch;

  const MatchInProgress({
    super.key,
    required this.handleSetFirstPlayerScore,
    required this.handleSetSecondPlayerScore,
    required this.latestMatch,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listOfNumbers =
        List<int>.generate(latestMatch.maxGameScore + 1, (i) => i);

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ListOfNumbers(
                  listOfNumbers: listOfNumbers,
                  handleButtonPress: handleSetFirstPlayerScore,
                ),
                Container(
                  width: 1.0,
                  height: 200.0,
                  decoration: const BoxDecoration(color: Colors.black),
                ),
                ListOfNumbers(
                    listOfNumbers: listOfNumbers,
                    handleButtonPress: handleSetSecondPlayerScore,
                    alignment: WheelScrollAlignment.right),
              ],
            ),
          )
        ],
      ),
    );
  }
}
