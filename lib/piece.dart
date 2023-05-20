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
          -5,
          -6,
          -16,
          -26
        ];
        break;
        case Tetromino.J:
        position=[
          -5,
          -6,
          -15,
          -25
        ];
        break;
        case Tetromino.I:
        position=[
          -4,
          -5,
          -6,
          -7
        ];
        break;
        case Tetromino.O:
        position=[
          -15,
          -16,
          -5,
          -6
        ];
        break;
        case Tetromino.S:
        position=[
         -15,
         -14,
         -6,
         -5 
        ];
        break;
        case Tetromino.Z:
        position=[
          -17,
          -16,
          -6,
          -5
        ];
        break;
        case Tetromino.T:
        position=[
          -26,
          -16,
          -6,
          -15
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