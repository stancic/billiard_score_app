import 'package:billiard_score_app/ui/match_history/match_history_screen.dart';
import 'package:flutter/material.dart';

class MatchSummaryScreen extends StatelessWidget {
  static const String route = '/match-summary';

  const MatchSummaryScreen({super.key});

  void _goToMatchHistory(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(MatchHistoryScreen.route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Match Summary'),
        automaticallyImplyLeading: false,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => _goToMatchHistory(context)),
      ),
      body: const Center(child: Text('Match Summary')),
    );
  }
}
