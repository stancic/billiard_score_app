import 'package:billiard_score_app/ui/common/full_width_elevated_button.dart';
import 'package:billiard_score_app/ui/match/match_screen.dart';
import 'package:flutter/material.dart';

import 'package:billiard_score_app/domain/interactor/match/match_interactor_impl.dart';
import 'package:billiard_score_app/ui/match/widgets/increment_match_properties_widget.dart';

class CreateMatchFormWidget extends StatefulWidget {
  const CreateMatchFormWidget({super.key});

  @override
  State<CreateMatchFormWidget> createState() => _CreateMatchFormWidgetState();
}

class _CreateMatchFormWidgetState extends State<CreateMatchFormWidget> {
  final _matchInteractor = MatchInteractorImpl();
  final GlobalKey _formKey = GlobalKey();
  int _gameTime = 0;
  int _gameScore = 0;

  void _incrementGameTime() {
    setState(() {
      _gameTime = _matchInteractor.incrementMatchProperty(_gameTime, 5);
    });
  }

  void _decrementGameTime() {
    setState(() {
      _gameTime = _matchInteractor.decrementMatchProperty(_gameTime, 5);
    });
  }

  void _incrementGameScore() {
    setState(() {
      _gameScore = _matchInteractor.incrementMatchProperty(_gameScore, 1);
    });
  }

  void _decrementGameScore() {
    setState(() {
      _gameScore = _matchInteractor.decrementMatchProperty(_gameScore, 1);
    });
  }

  void _startGame() {
    Navigator.of(context).pushReplacementNamed(MatchScreen.route);
  }

  @override
  Widget build(BuildContext context) {
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
              items: [],
              onChanged: null,
              value: 'Player 1',
              icon: const Icon(Icons.arrow_drop_down),
            ),
            const SizedBox(height: 10),
            DropdownButton(
              isExpanded: true,
              hint: const Text('Pick Player 2'),
              items: [],
              onChanged: null,
              value: 'Player 2',
              icon: const Icon(Icons.arrow_drop_down),
            ),
            const SizedBox(height: 10),
            IncrementMatchPropertiesWidget(
              title: 'Max. Game Time',
              gameProperty: _gameTime,
              incrementGameProperty: _incrementGameTime,
              decrementGameProperty: _decrementGameTime,
            ),
            const SizedBox(height: 10),
            IncrementMatchPropertiesWidget(
              title: 'Max. Game Score',
              gameProperty: _gameScore,
              incrementGameProperty: _incrementGameScore,
              decrementGameProperty: _decrementGameScore,
            ),
            const Spacer(),
            FullWidthElevatedButton(title: 'Add Game', onPressed: _startGame)
          ],
        ),
      ),
    );
  }
}
