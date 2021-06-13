import 'package:sudoku/classes/cell_class.dart';
import '../classes/sudocu_class.dart';
import 'p.dart';

SudokuLayout mainLayout = createMainLayout();

createMainLayout() {
  var res = createList(cells);
  var sudoku = SudokuLayout(body: res);
  return sudoku;
}

List<Cell> cells = [];
int idCounter = 1;
List createList(cells) {
  for (var y = 0; y < 9; y++) {
    for (var x = 0; x < 9; x++) {
      cells.add(Cell(
          id: idCounter, x: x, y: y, s: (y / 3).round() * 3 + (x / 3).round()));
      idCounter++;
    }
  }
  print(cells);
  return cells;
}
