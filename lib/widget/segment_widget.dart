import 'package:flutter/material.dart';

class SegmentOfSudoku extends StatelessWidget {
  const SegmentOfSudoku({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 170,
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width:4)
      ),
    );
  }
}
