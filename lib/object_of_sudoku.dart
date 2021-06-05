import 'package:sudoku/classes/cell_class.dart';
import 'classes/sudocu_class.dart';


SudokuLayout mainLayout = createMainLayout();

createMainLayout() {
  var res = createList(cells);
  var sudoku = SudokuLayout(body: res);
  return sudoku;
  // print(res[9].x);
  // print(res[9].y);
  // print(res[9].id);
  // print(sudoku.getSegment(1)[0].s);
  // print(sudoku.getSegment(2)[1].s);
  // print(sudoku.getSegment(3)[2].s);
  // print(sudoku.getSegment(4)[3].s);
  // print(sudoku.getSegment(5)[4].s);
  // print(sudoku.getSegment(6)[5].s);
  // print(sudoku.getSegment(7)[6].s);
  // print(sudoku.getSegment(8)[7].s);
  // print(sudoku.getSegment(9)[8].s);
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
