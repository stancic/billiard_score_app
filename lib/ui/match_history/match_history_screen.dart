import 'package:billiard_score_app/ui/common/app_drawer.dart';
import 'package:billiard_score_app/ui/match/create_match_screen.dart';
import 'package:flutter/material.dart';

class MatchHistoryScreen extends StatefulWidget {
  static const String route = '/';
  const MatchHistoryScreen({super.key});

  @override
  State<MatchHistoryScreen> createState() => _MatchHistoryScreenState();
}

class _MatchHistoryScreenState extends State<MatchHistoryScreen> {
  @override
  Widget build(BuildContext context) {
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
          children: const [
            Text('No Matches Played Yet!'),
          ],
        ),
      ),
    );
  }
}
