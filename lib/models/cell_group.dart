part of 'game_field.dart';

// for either row, column or square we will have same validation logic
class CellGroup {
  final List<GameCell> cells;

  const CellGroup(this.cells);

  bool get isValid => <int>[
        1, 2, 3, //
        4, 5, 6, //
        7, 8, 9, //
      ].every(
        (number) => cells.any(
          (GameCell cell) => cell.value == number,
        ),
      );
}
