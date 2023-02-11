import 'package:billiard_score_app/ui/common/full_width_elevated_button.dart';
import 'package:billiard_score_app/ui/match/match_summary_screen.dart';
import 'package:flutter/material.dart';

class MatchScreen extends StatefulWidget {
  static const String route = '/match';

  const MatchScreen({super.key});

  @override
  State<MatchScreen> createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> {
  void _finishGame(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(MatchSummaryScreen.route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Game'),
        automaticallyImplyLeading: false,
      ),
      body: Column(children: [
        const Text('Match has started'),
        FullWidthElevatedButton(
          title: 'Finish Game',
          onPressed: () => _finishGame(context),
        ),
      ]),
    );
  }
}
