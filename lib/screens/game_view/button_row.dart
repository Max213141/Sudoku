import 'package:flutter/material.dart';
import 'package:sudoku/screens/game_view/button.dart';

class ButtonRow extends StatelessWidget {
  const ButtonRow({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 1; i <= 9; i++) GameValueButton(value: i),
        ],
      ),
    );
  }
}
