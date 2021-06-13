part of 'game_field.dart';

class GameCell {
  final bool fixed;
  final int value;
  final int index;

  const GameCell({this.fixed = false, this.value, this.index});

  GameCell copyWith({
    bool fixed,
    int value,
    int index,
  }) {
    return GameCell(
      fixed: fixed ?? this.fixed,
      value: value ?? this.value,
      index: index ?? this.index,
    );
  }
}
