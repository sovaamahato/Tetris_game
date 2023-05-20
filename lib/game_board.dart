import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tetris_game/piece.dart';
import 'package:tetris_game/pixel.dart';
import 'package:tetris_game/values.dart';

/*
GAME BOARD

*/

//CREATE a game board
List<List<Tetromino?>> gameBoard = List.generate(rowLength, (i) => List.generate(columnLenth, (index) => null));

class GameBoard extends StatefulWidget {
  const GameBoard({super.key});

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  //current tetris piece
  Piece currentPiece = Piece(type: Tetromino.L);

  @override
  void initState() {
    super.initState();
    //start the game when app start
    startGame();
  }

  void startGame() {
    currentPiece.initializePiece();

    //frame refresh rate
    Duration frameRate = const Duration(milliseconds: 400);
    gameLoop(frameRate);
  }

  void gameLoop(Duration frameRate) {
    Timer.periodic(frameRate, (timer) {
      setState(() {
        //move current piece down
        currentPiece.moveTetris(Direction.Down);
      });
    });
  }

  //CHECK FOR COLLISION
  //return true-> if there is collision
  //return false-> if there is no collision
  bool checkCollision(Direction direction) {
    //loop through each row and column of the current position
    for (int i = 0; i < currentPiece.position.length; i++) {
      //calculate the row and column of current position
      int row = (currentPiece.position[i] / columnLenth).floor();
      int col = currentPiece.position[i] % rowLength;

      //adjust the row and col based on the direction
      if (direction == Direction.Left) {
        col -= 1;
      } else if (direction == Direction.Right) {
        col += 1;
      } else if (direction == Direction.Down) {
        row += 1;
      }

      //check if the piece is out of bounds(either too low or too far to the left or right)
      if (row >= rowLength || col < 0 || col >= columnLenth) {
        return true;
      }
    }
    //if no collision detected
    return false;
  }

  void checkLanding() {
    //if going down is occupied
    if (checkCollision(Direction.Down)) {
      //mark position as occupied on the gameboard
      for (int i = 0; i < currentPiece.position.length; i++) {
        int row = (currentPiece.position[i] / columnLenth).floor();
        int col = currentPiece.position[i] % columnLenth;
        if (row >= 0 && col >= 0) {
          gameBoard[row][col]==currentPiece.type;
        }
      }

      //once landed , create next piece
      createNewPiece();
    }
  }

  void createNewPiece(){
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GridView.builder(
          itemCount: rowLength * columnLenth,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columnLenth,
          ),
          itemBuilder: (context, index) {
            if (currentPiece.position.contains(index)) {
              return Pixel(
                color: Colors.yellow,
              );
            } else {
              return Pixel(
                color: Colors.grey[900],
              );
            }
          }),
    );
  }
}
