import 'package:billiard_score_app/modules/match/hooks/hooks.dart';
import 'package:billiard_score_app/modules/match/providers/providers.dart';
import 'package:flutter/material.dart';

import 'package:billiard_score_app/modules/match/widgets/widgets.dart';
import 'package:billiard_score_app/ui/common/full_width_elevated_button.dart';
import 'package:billiard_score_app/ui/match/match_summary_screen.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MatchScreen extends HookConsumerWidget {
  static const String route = '/match';

  const MatchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firstPlayerScore = useState(0);
    final secondPlayerScore = useState(0);

    final matchProperties = useMatchProperties(ref);
    final matchNotifier = ref.watch(matchProvider.notifier);
    final latestMatch =
        useMemoized(matchNotifier.getLatestMatch, [matchNotifier]);

    final maxGameTime = latestMatch?.maxGameTime ?? 0;
    final maxGameScore = latestMatch?.maxGameScore;
    final firstPlayer = latestMatch?.firstPlayer;
    final secondPlayer = latestMatch?.secondPlayer;

    final gameTime =
        useState(matchProperties.formatMatchTime(maxGameTime * 60));

    void handleSetFirstPlayerScore(int score) {
      firstPlayerScore.value = score;
    }

    void handleSetSecondPlayerScore(int score) {
      secondPlayerScore.value = score;
    }

    void finishGame() {
      if (latestMatch == null) return;

      matchNotifier.setLatestMatchScore(
        firstPlayerScore.value,
        secondPlayerScore.value,
      );
      Navigator.of(context).pushReplacementNamed(MatchSummaryScreen.route);
    }

    useEffect(() {
      if (maxGameTime == 0) return;
      matchProperties.handleTimer(finishGame, maxGameTime, gameTime);
    }, [maxGameTime]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('New Game'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          const Text('Match has started'),
          Text(
            'Max. Game Score: $maxGameScore',
          ),
          Text(
            'Max. Game Time: $maxGameTime',
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Divider(
              color: Colors.black,
              height: 1.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${firstPlayer?.firstName} ${firstPlayer?.lastName}'),
                Text('${secondPlayer?.firstName} ${secondPlayer?.lastName}'),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (latestMatch != null)
                  MatchInProgress(
                    handleSetFirstPlayerScore: handleSetFirstPlayerScore,
                    handleSetSecondPlayerScore: handleSetSecondPlayerScore,
                    latestMatch: latestMatch,
                  ),
                Text(gameTime.value),
                FullWidthElevatedButton(
                  title: 'Finish Game',
                  onPressed: () => finishGame(),
                  icon: Icons.add,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
