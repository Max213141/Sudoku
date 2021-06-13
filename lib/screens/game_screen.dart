import 'package:flutter/material.dart';
import 'package:sudoku/screens/game_state_provider.dart';
import 'package:sudoku/screens/game_view/game_view.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Align(
          child: GameStateWidget(
            child: GameView(),
          ),
        ),
      ),
    );
  }
}
