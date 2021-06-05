class SudokuLayout{
  List body;
  SudokuLayout({this.body});

  getRow(n){
    List row = [];

    for(var i=0; i<9; i++){
      row.add(body[9*n+i]);
    }
    return row;
  }

  getColumn(n){
    List column = [];

    for(var i=0; i<9; i++){
      column.add(body[9*i+n]);
    }
    return column;
  }

  getSegment(n){
    List segment = [];

    var x = n % 3;
    var y = (n/3).round();

    for(var dy=0; dy<3; dy++){
      for(var dx=0; dx<3; dx++){
        segment.add(body[
          y*27+dy*9+x*3+dx
        ]);
      }
    }
    return segment;
  }
}