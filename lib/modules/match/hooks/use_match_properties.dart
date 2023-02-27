import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:billiard_score_app/modules/match/model/model.dart';
import 'package:billiard_score_app/modules/match/providers/providers.dart';

typedef ValueChangeFunction = void Function(ValueNotifier<int>, int);
typedef PlayerList = List<DropdownMenuItem<PlayerModel>> Function(
    List<PlayerModel>);
typedef MatchPropertiesMap = Map<String, Function>;

extension MatchPropertiesMapExtension on MatchPropertiesMap {
  void Function(ValueNotifier<int>, int) get incrementMatchProperty =>
      this['incrementMatchProperty'] as void Function(ValueNotifier<int>, int);

  void Function(ValueNotifier<int>, int) get decrementMatchProperty =>
      this['decrementMatchProperty'] as void Function(ValueNotifier<int>, int);

  void Function(Function, int, ValueNotifier<String>) get handleTimer =>
      this['handleTimer'] as void Function(
          Function, int, ValueNotifier<String>);

  String Function(int) get formatMatchTime =>
      this['formatMatchTime'] as String Function(int);

  List<DropdownMenuItem<PlayerModel>> Function(List<PlayerModel>)
      get generatePlayerDropdownValues => this['generatePlayerDropdownValues']
          as List<DropdownMenuItem<PlayerModel>> Function(List<PlayerModel>);

  List<MatchModel> Function() get getMatches =>
      this['getMatches'] as List<MatchModel> Function();

  void Function(Match) get addMatch => this['addMatch'] as void Function(Match);
}

class MatchProperties {
  void incrementMatchProperty(ValueNotifier<int> incrementor, int incrementBy) {
    incrementor.value += incrementBy;
  }

  void decrementMatchProperty(ValueNotifier<int> decrementor, int decrementBy) {
    if (decrementor.value < decrementBy) {
      decrementor.value = 0;
      return;
    }
    decrementor.value -= decrementBy;
  }

  void handleTimer({
    required Function callback,
    required int startTimeInMinutes,
    required ValueNotifier<String> gameTime,
  }) {
    late Timer timer;
    int startSeconds = startTimeInMinutes * 60;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      startSeconds -= 1;
      if (startSeconds == 0) {
        callback();
        timer.cancel();
      }

      int minutes = startSeconds ~/ 60;
      int seconds = (startSeconds % 60);
      gameTime.value =
          "${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}";
    });
  }

  String formatMatchTime(int timeInSeconds) {
    int sec = timeInSeconds % 60;
    int min = (timeInSeconds / 60).floor();
    String minute = min.toString().length <= 1 ? "0$min" : "$min";
    String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
    return "$minute : $second";
  }

  List<DropdownMenuItem<PlayerModel>> generatePlayerDropdownValues(
      List<PlayerModel> playerList) {
    if (playerList.isEmpty) return [];
    return playerList
        .map(
          (player) => DropdownMenuItem(
            value: player,
            child: Text('${player.firstName} ${player.lastName}'),
          ),
        )
        .toList();
  }
}

MatchPropertiesMap useMatchProperties([WidgetRef? ref]) {
  final matchProviderState =
      useMemoized(() => ref?.watch(matchProvider), [ref]);
  final matchNotifier =
      useMemoized(() => ref?.watch(matchProvider.notifier), [ref]);

  final matchProperties = useMemoized(() => MatchProperties());

  ValueChangeFunction incrementMatchProperty() {
    return (ValueNotifier<int> incrementor, int incrementBy) =>
        matchProperties.incrementMatchProperty(incrementor, incrementBy);
  }

  ValueChangeFunction decrementMatchProperty() {
    return (ValueNotifier<int> decrementor, int decrementBy) =>
        matchProperties.decrementMatchProperty(decrementor, decrementBy);
  }

  void Function(Function, int, ValueNotifier<String>) handleTimer() {
    return (
      Function callback,
      int startTimeInMinutes,
      ValueNotifier<String> gameTime,
    ) =>
        matchProperties.handleTimer(
          callback: callback,
          startTimeInMinutes: startTimeInMinutes,
          gameTime: gameTime,
        );
  }

  String Function(int) formatMatchTime() {
    return (int timeInSeconds) =>
        matchProperties.formatMatchTime(timeInSeconds);
  }

  PlayerList generatePlayerDropdownValues() {
    return (List<PlayerModel> players) =>
        matchProperties.generatePlayerDropdownValues(players);
  }

  List<MatchModel> Function() getMatches() {
    return () => matchProviderState == null
        ? []
        : matchProviderState.map((e) => e.match).toList();
  }

  void Function(Match) addMatch() {
    return (Match match) => matchNotifier?.addMatch(match);
  }

  return {
    'incrementMatchProperty': incrementMatchProperty(),
    'decrementMatchProperty': decrementMatchProperty(),
    'handleTimer': handleTimer(),
    'formatMatchTime': formatMatchTime(),
    'generatePlayerDropdownValues': generatePlayerDropdownValues(),
    'getMatches': getMatches(),
    'addMatch': addMatch(),
  };
}
