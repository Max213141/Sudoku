import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sudoku/models/game_field.dart';
import 'package:sudoku/screens/game_state_provider.dart';

class GameCellView extends StatelessWidget {
  final GameCell cell;

  const GameCellView({
    Key key,
    this.cell,
  }) : super(key: key);

  bool isActive(BuildContext context) {
    return cell.index == GameStateProvider.of(context).activeCell;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        if (isActive(context)) {
          GameStateProvider.of(context).resetActiveCell();
        } else {
          GameStateProvider.of(context).setActiveCell(cell.index);
        }
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.teal[100],
          border: Border.all(
            width: isActive(context) ? 4 : 2,
            color: isActive(context) ? Colors.red : Colors.black,
          ),
        ),
        child: Text(
          cell.value.toString(),
          style: TextStyle(
            fontSize: 24,
            fontFeatures: [
              FontFeature.tabularFigures(),
            ],
            fontWeight: cell.fixed ? FontWeight.w800 : FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
