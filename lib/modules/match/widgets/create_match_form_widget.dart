import 'package:billiard_score_app/modules/match/providers/providers.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';

import 'package:billiard_score_app/modules/match/hooks/hooks.dart';
import 'package:billiard_score_app/modules/match/model/model.dart';
import 'package:billiard_score_app/shared/consts/consts.dart';
import 'package:billiard_score_app/ui/common/full_width_elevated_button.dart';
import 'package:billiard_score_app/ui/match/match_screen.dart';

import 'package:billiard_score_app/modules/match/widgets/increment_match_properties_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CreateMatchFormWidget extends HookConsumerWidget {
  final GlobalKey _formKey = GlobalKey();

  CreateMatchFormWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final maxGameTime = useState(0);
    final maxGameScore = useState(0);
    final gamePlayers = useState<List<DropdownMenuItem<PlayerModel>>>([]);
    final selectedFirstPlayer = useState<PlayerModel?>(null);
    final selectedSecondPlayer = useState<PlayerModel?>(null);

    final matchProperties = useMatchProperties(ref);

    void startGame() {
      final isInvalid = selectedFirstPlayer.value == null ||
          selectedSecondPlayer.value == null ||
          maxGameScore.value == 0 ||
          maxGameTime.value == 0;

      if (isInvalid) return;

      MatchModel match = MatchModel(
        matchId: DateTime.now().toString(),
        firstPlayer: selectedFirstPlayer.value as PlayerModel,
        secondPlayer: selectedSecondPlayer.value as PlayerModel,
        maxGameTime: maxGameTime.value,
        maxGameScore: maxGameScore.value,
      );

      matchProperties.addMatch(Match(match: match));

      Navigator.of(context).pushReplacementNamed(MatchScreen.route);
    }

    useEffect(() {
      gamePlayers.value = matchProperties.generatePlayerDropdownValues(players);
    }, [players]);

    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButton(
              isExpanded: true,
              hint: const Text('Pick Player 1'),
              items: gamePlayers.value,
              onChanged: (player) => selectedFirstPlayer.value = player,
              value: selectedFirstPlayer.value,
              icon: const Icon(Icons.arrow_drop_down),
            ),
            const SizedBox(height: 10),
            DropdownButton(
              isExpanded: true,
              hint: const Text('Pick Player 2'),
              items: gamePlayers.value,
              onChanged: (player) => selectedSecondPlayer.value = player,
              value: selectedSecondPlayer.value,
              icon: const Icon(Icons.arrow_drop_down),
            ),
            const SizedBox(height: 10),
            IncrementMatchPropertiesWidget(
              title: 'Max. Game Time',
              gameProperty: maxGameTime.value,
              incrementGameProperty: () =>
                  matchProperties.incrementMatchProperty(maxGameTime, 1),
              decrementGameProperty: () =>
                  matchProperties.decrementMatchProperty(maxGameTime, 1),
            ),
            const SizedBox(height: 10),
            IncrementMatchPropertiesWidget(
              title: 'Max. Game Score',
              gameProperty: maxGameScore.value,
              incrementGameProperty: () =>
                  matchProperties.incrementMatchProperty(maxGameScore, 1),
              decrementGameProperty: () =>
                  matchProperties.decrementMatchProperty(maxGameScore, 1),
            ),
            const Spacer(),
            FullWidthElevatedButton(title: 'Add Game', onPressed: startGame)
          ],
        ),
      ),
    );
  }
}
