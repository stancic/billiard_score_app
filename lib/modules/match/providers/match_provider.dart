import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:billiard_score_app/modules/match/model/model.dart';

typedef MatchProvider = StateNotifierProvider<MatchNotifier, List<Match>>;

@immutable
class Match {
  final MatchModel match;
  const Match({required this.match});

  Match copyWith({MatchModel? match}) {
    return Match(match: match ?? this.match);
  }
}

class MatchNotifier extends StateNotifier<List<Match>> {
  MatchNotifier(this.ref) : super([]);

  final Ref ref;

  void addMatch(Match match) {
    state = [...state, match];
  }

  List<MatchModel> getMatches() {
    return state.map((e) => e.match).toList();
  }
}

final MatchProvider matchProvider =
    StateNotifierProvider<MatchNotifier, List<Match>>((ref) {
  return MatchNotifier(ref);
});
