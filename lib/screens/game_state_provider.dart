import 'package:flutter/material.dart';
import 'package:sudoku/models/game_field.dart';

class GameStateWidget extends StatefulWidget {
  GameStateWidget({
    Key key,
    this.child,
  }) : super(key: key);
  final Widget child;
  @override
  _GameStateWidgetState createState() => _GameStateWidgetState();
}

class _GameStateWidgetState extends State<GameStateWidget> {
  GameField field = GameField.mock;
  int activeCell;

  void setActiveCell(int index) => setState(
        () {
          activeCell = index;
        },
      );

  void setField(GameField newField) => setState(
        () {
          field = newField;
        },
      );

  @override
  Widget build(BuildContext context) {
    return GameStateProvider(
      child: widget.child,
      activeCell: activeCell,
      setActiveCell: setActiveCell,
      setField: setField,
      field: field,
    );
  }
}

class GameStateProvider extends InheritedWidget {
  GameStateProvider({
    Key key,
    @required this.child,
    @required this.activeCell,
    @required this.setActiveCell,
    @required this.setField,
    @required this.field,
  }) : super(
          key: key,
          child: child,
        );

  final Widget child;

  final GameField field;
  final int activeCell;
  int get activeCellX => activeCell % side;
  int get activeCellY => activeCell ~/ side;

  final ValueSetter<int> setActiveCell;
  void resetActiveCell() => setActiveCell(null);
  final ValueSetter<GameField> setField;

  void setCellValue(int newValue) {
    if (activeCell != null && !field.cells[activeCell].fixed)
      setField(
        field.setCell(
          activeCellX,
          activeCellY,
          field.cells[activeCell].copyWith(value: newValue),
        ),
      );
  }

  static GameStateProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<GameStateProvider>();
  }

  @override
  bool updateShouldNotify(GameStateProvider oldWidget) {
    return true;
  }
}
