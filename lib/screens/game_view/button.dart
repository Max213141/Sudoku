import 'package:flutter/material.dart';
import 'package:sudoku/screens/game_state_provider.dart';

class GameValueButton extends StatelessWidget {
  final int value;

  const GameValueButton({Key key, this.value}) : super(key: key);

  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        GameStateProvider.of(context).setCellValue(value); // Вызов при нажатии
      },
      child: Container(
        height: 50,
        width: 50,
        child: Text(value.toString()),
        color: Colors.green,
      ),
    );
  }
}
