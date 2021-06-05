import 'package:flutter/material.dart';
import 'package:sudoku/classes/cell_class.dart';
import 'package:sudoku/classes/sudocu_class.dart';
import 'package:sudoku/widget/full_sudoku_widget.dart';

void main() {
  runApp(MyApp());

}




class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sudoku',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(

        alignment: Alignment.center,
        child: Sudoku(),
      ),
    );
  }
}
