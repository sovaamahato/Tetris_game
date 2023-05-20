import 'package:tetris_game/values.dart';

class Piece{

  //type of tetris piece
  Tetromino type;
  Piece({required this.type});
// the piece is just a list of number
List<int> position=[];


  //generate the integers
  void initializePiece(){
    switch(type){
      case Tetromino.L:
        position=[
          4,14,24,25
        ];
        break;
        default:
    }
  }
//to move the boxes
  void moveTetris(Direction direction){
    switch(direction){
      case Direction.Down:
        for(int i=0;i<position.length;i++){
          position[i]+=columnLenth;
        }
        break;
        case Direction.Left:
        for(int i=0;i<position.length;i++){
          position[i]-=1;
        }
        break;
        case Direction.Right:
        for(int i=0;i<position.length;i++){
          position[i]+=1;
        }
        break;
    }
  }
}