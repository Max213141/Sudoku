import 'package:flutter/foundation.dart';

part 'cell_group.dart';
part 'cell_retrieve_function.dart';
part 'game_cell.dart';
part 'game_field_part.dart';

const int squareSide = 3;
const int side = squareSide * squareSide;
const int size = side * side;

class GameField {
  GameCell getCell(int x, int y) => cells[x + y * side];

  const GameField(this.cells);
  static GameField mock = GameField([
    for (int i = 0; i < side * side; i++)
      GameCell(
        index: i,
        fixed: i.isEven,
        value: (i + i ~/ 9 + 3) % 9,
      )
  ]);

  final List<GameCell> cells;

  GameFieldPart get squares => _Squares(getCell);
  GameFieldPart get cols => _Columns(getCell);
  GameFieldPart get rows => _Rows(getCell);

  /// check if player solved the game
  bool get isValid => squares.isValid && cols.isValid && rows.isValid;

  // create a new GameField object with changed value
  GameField setCell(int x, int y, GameCell newValue) {
    List<GameCell> newCells = cells.toList(); // create a copy of a list
    newCells[x + y * side] = newValue;
    return GameField(newCells);
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is GameField && listEquals(o.cells, cells);
  }

  @override
  int get hashCode => cells.hashCode;
}
