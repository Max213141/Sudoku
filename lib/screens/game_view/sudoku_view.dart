import 'package:flutter/material.dart';
import 'package:sudoku/models/game_field.dart';
import 'package:sudoku/screens/game_state_provider.dart';
import 'package:sudoku/screens/game_view/game_cell_view.dart';

class SudokuView extends StatefulWidget {
  SudokuView({Key key}) : super(key: key);

  @override
  _SudokuViewState createState() => _SudokuViewState();
}

class _SudokuViewState extends State<SudokuView> {
  GameField field;
  int activeCell;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    field = GameStateProvider.of(context).field;
    activeCell = GameStateProvider.of(context).activeCell;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      width: 600,
      decoration: BoxDecoration(
        border: Border.all(width: 4),
        color: Colors.teal,
      ),
      padding: EdgeInsets.all(4),
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 9,
        children: field.cells
            .map(
              (cell) => GameCellView(cell: cell),
            )
            .toList(),
      ),
    );
  }
}
