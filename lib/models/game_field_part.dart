part of 'game_field.dart';

abstract class GameFieldPart {
  const GameFieldPart();

  CellRetrieveFunction get getCell;

  bool get isValid {
    bool result = true;
    for (int fieldNumber = 0; fieldNumber < 9; fieldNumber++) {
      result &= this[fieldNumber].isValid;
    }
    return result;
  }

  CellGroup operator [](int index);
}

class _Squares extends GameFieldPart {
  @override
  final CellRetrieveFunction getCell;

  const _Squares(this.getCell);

  @override
  CellGroup operator [](int index) {
    if (index < 0 || index > 8) {
      throw RangeError.index(index, _Squares);
    }

    final int dx = (index % 3) * squareSide;
    final int dy = (index ~/ 3) * squareSide;

    return CellGroup(
      [
        for (int dj = 0; dj < 3; dj++)
          for (int di = 0; di < 3; di++) getCell(dx + di, dy + dj),
      ],
    );
  }
}

class _Columns extends GameFieldPart {
  @override
  final CellRetrieveFunction getCell;

  const _Columns(this.getCell);

  @override
  CellGroup operator [](int index) {
    if (index < 0 || index > 8) {
      throw RangeError.index(index, _Squares);
    }

    final int dx = index;

    return CellGroup(
      [
        for (int dy = 0; dy < 9; dy++) getCell(dx, dy),
      ],
    );
  }
}

class _Rows extends GameFieldPart {
  @override
  final CellRetrieveFunction getCell;

  const _Rows(this.getCell);

  @override
  CellGroup operator [](int index) {
    if (index < 0 || index > 8) {
      throw RangeError.index(index, _Squares);
    }

    final int dy = index;

    return CellGroup(
      [
        for (int dx = 0; dx < 9; dx++) getCell(dx, dy),
      ],
    );
  }
}
