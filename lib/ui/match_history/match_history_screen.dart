import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:billiard_score_app/modules/match/hooks/hooks.dart';
import 'package:billiard_score_app/ui/common/app_drawer.dart';
import 'package:billiard_score_app/ui/match/create_match_screen.dart';

class MatchHistoryScreen extends HookConsumerWidget {
  static const String route = '/';
  const MatchHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final matchProperties = useMatchProperties(ref);

    final matches = useMemoized(() => matchProperties.getMatches(), []);

    // print(matchList.length);

    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('Match History'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(CreateMatchScreen.route);
              },
              child: const Icon(Icons.add),
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: matches.isEmpty
              ? const [
                  Text('No Matches Played Yet!'),
                ]
              : matches
                  .map(
                    (match) => Text(
                      '${match.firstPlayer.firstName} ${match.firstPlayer.lastName} vs ${match.secondPlayer.firstName} ${match.secondPlayer.lastName}',
                    ),
                  )
                  .toList(),
        ),
      ),
    );
  }
}
