import 'package:billiard_score_app/modules/match/providers/providers.dart';
import 'package:billiard_score_app/ui/common/full_width_elevated_button.dart';
import 'package:billiard_score_app/ui/match_history/match_history_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MatchSummaryScreen extends HookConsumerWidget {
  static const String route = '/match-summary';

  const MatchSummaryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final matchNotifier = ref.watch(matchProvider.notifier);
    final latestMatch =
        useMemoized(matchNotifier.getLatestMatch, [matchNotifier]);

    final firstPlayer = latestMatch?.firstPlayer;
    final secondPlayer = latestMatch?.secondPlayer;

    void goToMatchHistory(BuildContext context) {
      Navigator.of(context).pushReplacementNamed(MatchHistoryScreen.route);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Match Summary'),
        automaticallyImplyLeading: false,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => goToMatchHistory(context)),
      ),
      body: Column(
        children: [
          Column(
            children: [
              const Text('Match Summary'),
              Text(
                '${firstPlayer?.firstName} ${firstPlayer?.lastName} scored: ${latestMatch?.firstPlayerScore}',
              ),
              Text(
                '${secondPlayer?.firstName} ${secondPlayer?.lastName} scored: ${latestMatch?.secondPlayerScore}',
              )
            ],
          ),
          FullWidthElevatedButton(
            title: 'Done',
            onPressed: () => goToMatchHistory(context),
          ),
        ],
      ),
    );
  }
}
