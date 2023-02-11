import 'package:billiard_score_app/ui/common/app_drawer.dart';
import 'package:flutter/material.dart';

class LeaderBoardScreen extends StatelessWidget {
  static const String route = '/leaderboard';

  const LeaderBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(title: const Text('Leaderboards')),
    );
  }
}
