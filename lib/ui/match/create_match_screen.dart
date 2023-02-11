import 'package:flutter/material.dart';

import 'package:billiard_score_app/ui/match/widgets/create_match_form_widget.dart';

class CreateMatchScreen extends StatelessWidget {
  static const String route = '/create-match';

  const CreateMatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Match'),
      ),
      body: const CreateMatchFormWidget(),
    );
  }
}
