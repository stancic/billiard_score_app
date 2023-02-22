import 'package:billiard_score_app/modules/match/model/player.dart';

class MatchModel {
  final String matchId;
  final PlayerModel firstPlayer;
  final PlayerModel secondPlayer;
  final int gameTime;
  final int gameScore;

  MatchModel({
    required this.matchId,
    required this.firstPlayer,
    required this.secondPlayer,
    required this.gameTime,
    required this.gameScore,
  });
}
