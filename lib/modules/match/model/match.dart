import 'package:billiard_score_app/modules/match/model/player.dart';

class MatchModel {
  final String matchId;
  final PlayerModel firstPlayer;
  final PlayerModel secondPlayer;
  final int maxGameTime;
  final int maxGameScore;
  int firstPlayerScore;
  int secondPlayerScore;

  MatchModel({
    required this.matchId,
    required this.firstPlayer,
    required this.secondPlayer,
    required this.maxGameTime,
    required this.maxGameScore,
    this.firstPlayerScore = 0,
    this.secondPlayerScore = 0,
  });
}
