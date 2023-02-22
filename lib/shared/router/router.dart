import 'package:billiard_score_app/ui/leaderboard/leaderboard_screen.dart';
import 'package:billiard_score_app/ui/match/create_match_screen.dart';
import 'package:billiard_score_app/ui/match/match_screen.dart';
import 'package:billiard_score_app/ui/match/match_summary_screen.dart';
import 'package:billiard_score_app/ui/not_found/not_found_screen.dart';
import 'package:billiard_score_app/ui/ui.dart';
import 'package:flutter/material.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MatchHistoryScreen.route:
        return MaterialPageRoute(builder: (_) => MatchHistoryScreen());
      case CreateMatchScreen.route:
        return MaterialPageRoute(builder: (_) => CreateMatchScreen());
      case MatchScreen.route:
        return MaterialPageRoute(builder: (_) => MatchScreen());
      case LeaderBoardScreen.route:
        return MaterialPageRoute(builder: (_) => LeaderBoardScreen());
      case MatchSummaryScreen.route:
        return MaterialPageRoute(builder: (_) => MatchSummaryScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => NotFoundScreen(
            route: settings.name.toString(),
          ),
        );
    }
  }
}
