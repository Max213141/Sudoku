import 'package:flutter/material.dart';
import 'package:sudoku/widget/segment_widget.dart';

class Sudoku extends StatefulWidget {
  const Sudoku({Key key}) : super(key: key);

  @override
  _SudokuState createState() => _SudokuState();
}

class _SudokuState extends State<Sudoku> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 510,
      height: 510,
      color: Colors.cyanAccent[100],
      alignment: Alignment.topLeft,
      child: Flex(
        clipBehavior: ,
        direction: Axis.horizontal,
        children: [
          SegmentOfSudoku(),
          SegmentOfSudoku(),
          SegmentOfSudoku(),
        ]
      )
    );
  }
}
