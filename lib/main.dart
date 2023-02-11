import 'package:billiard_score_app/common/router/router.dart';
import 'package:flutter/material.dart';
import 'ui/ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: RouterGenerator.generateRoute,
      initialRoute: MatchHistoryScreen.route,
    );
  }
}
