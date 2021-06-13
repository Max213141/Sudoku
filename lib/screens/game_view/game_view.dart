import 'package:flutter/material.dart';

import 'button_row.dart';
import 'sudoku_view.dart';

class GameView extends StatelessWidget {
  const GameView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SudokuView(),
        ButtonRow(),
      ],
    );
  }
}
