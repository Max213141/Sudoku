// import 'package:flutter/material.dart';
// import 'package:sudoku/models/game_field.dart';
// import 'package:sudoku/widget/segment_widget.dart';

// class Sudoku extends StatefulWidget {
//   const Sudoku({Key key}) : super(key: key);

//   @override
//   _SudokuState createState() => _SudokuState();
// }

// class _SudokuState extends State<Sudoku> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         color: Colors.cyanAccent[100],
//         alignment: Alignment.topLeft,
//         child: Column(
//           children: [
//             Flex(
//               direction: Axis.horizontal,
//               children: [
//                 SegmentOfSudoku(),
//                 SegmentOfSudoku(),
//                 SegmentOfSudoku(),
//               ],
//             ),
//             SizedBox(height: 30),
//             Flex(
//               direction: Axis.horizontal,
//               children: listOfNumbers(),
//             )
//           ],
//         ));
//   }
// }
