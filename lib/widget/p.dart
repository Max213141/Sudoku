import 'package:flutter/material.dart';

const int side = 9;
const int squareSide = 3;

typedef CellRetrieveFunction = int Function(int x, int y); //Объявление типа

class GameField {
  static const int size = side * side; // нигде не используется
  int getCell(int x, int y) => cells[x +
      y * side]; // хз как можно обратится к тому что непонятно где обозначено

  const GameField(this.cells); //хз что делает
  final List<int> cells; // Объявление массива
  _Squares get squares => _Squares(getCell); // получение сегментов(squers)
  _Columns get cols => _Columns(getCell); // получение сегментов(columns)
  _Rows get rows => _Rows(getCell); // получение сегментов(rows)

  bool get isValid => squares.isValid && cols.isValid && rows.isValid;

  // create a new GameField object with changed value
  GameField setCell(int x, int y, int newValue) {
    //Создание нового объекта с новыми значениями в гэймфилде
    List<int> newCells = cells.toList(); // create a copy of a list
    newCells[x + y * side] = newValue; // находим нужную ячейку
    return GameField(newCells); // меняем значение на новое
  }
}

abstract class FieldPart {
  const FieldPart();

  CellRetrieveFunction get getCell;

  bool get isValid {
    bool result = true;
    for (int squareNumber = 0; squareNumber < 9; squareNumber++) {
      result &= this[squareNumber].isValid;
    }
    return result;
  }

  CellGroup operator [](int index);
}

class _Squares extends FieldPart {
  @override
  final CellRetrieveFunction getCell;

  const _Squares(this.getCell);

  @override
  CellGroup operator [](int index) {
    if (index < 0 || index > 8) {
      throw RangeError.index(index, _Squares);
    }

    final int dx = (index % 3) * squareSide; // хз что это
    final int dy = (index ~/ 3) * squareSide; // хз что это

    return CellGroup(
      [
        for (int dj = 0; dj < 3; dj++)
          for (int di = 0; di < 3; di++) getCell(dx + di, dy + dj),
      ],
    );
  }
}

// bool get isValid {
//   bool result = true;
//   for (int squareNumber = 0; squareNumber < 9; squareNumber++) {
//     result &= this[squareNumber].isValid;// !!непонятный знак =, логика обращения к this[индекс] обращение к исВалид
//   }
//   return result;
// }

class _Columns extends FieldPart {
  @override
  final CellRetrieveFunction getCell;

  const _Columns(this.getCell);

  @override
  CellGroup operator [](int index) {
    if (index < 0 || index > 8) {
      throw RangeError.index(index, _Columns);
    }

    final int dx = index;

    return CellGroup(
      [
        for (int dy = 0; dy < 9; dy++) getCell(dx, dy),
      ],
    );
  }
}

class _Rows extends FieldPart {
  @override
  final CellRetrieveFunction getCell;

  const _Rows(this.getCell);

  @override
  CellGroup operator [](int index) {
    if (index < 0 || index > 8) {
      throw RangeError.index(index, _Rows);
    }

    final int dy = index;

    return CellGroup(
      [
        for (int dx = 0; dx < 9; dx++) getCell(dx, dy),
      ],
    );
  }
}

// for either row, column or square we will have same logic
class CellGroup {
  final List<int> cells;

  const CellGroup(this.cells);
  bool get isValid => <int>[
        //Проверка на валидность
        for (int i = 1; i <= 9; i++) i,
      ].every(
        (element) => cells.contains(
            element), //Я понимаю это как проверка всего массива на наличие
        // значения и если оно присутствует то будет возвращено тру
      );
}

class StateWidget extends InheritedWidget {
  // Создание контролирующего виджета
  StateWidget({Key key, this.child}) : super(key: key, child: child);

  final Widget child;
  GameField field;

  int activeCell;
  int get activeCellX => activeCell % side;
  int get activeCellY => activeCell ~/ side;

  void setCellValue(int newValue) {
    // Ф-ция для смены числа в поле вызывается при нажатии кнопки
    if (activeCell != null)
      field = field.setCell(
        activeCellX,
        activeCellY,
        newValue,
      );
  }

  void setActiveCell(int index) =>
      activeCell = index; // установка активной клетки
  void resetActiveCell() => setActiveCell(null); //сброс активной клетки

  static StateWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<StateWidget>();
  }

  @override
  bool updateShouldNotify(StateWidget oldWidget) {
    return true; // всегда уведомляет об изменении
  }
}

class ValueSetButton extends StatelessWidget {
  //Создание кастомной кнопки
  final int index;
  final int value;

  const ValueSetButton({Key key, this.index, this.value}) : super(key: key);

  Widget build(BuildContext context) {
    return MaterialButton(onPressed: () {
      StateWidget.of(context).setCellValue(value); // Вызов при нажатии
    });
  }
}
