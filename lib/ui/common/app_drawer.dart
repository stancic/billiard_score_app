import 'package:billiard_score_app/ui/leaderboard/leaderboard_screen.dart';
import 'package:billiard_score_app/ui/match_history/match_history_screen.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        AppBar(
          title: const Text('Billiard Scores'),
          automaticallyImplyLeading: false,
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.history),
          title: const Text('Match History'),
          onTap: () {
            Navigator.of(context)
                .pushReplacementNamed(MatchHistoryScreen.route);
          },
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.leaderboard),
          title: const Text('Leaderboard'),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(LeaderBoardScreen.route);
          },
        ),
      ]),
    );
  }
}
