import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tetris_game/piece.dart';
import 'package:tetris_game/pixel.dart';
import 'package:tetris_game/values.dart';

class GameBoard extends StatefulWidget {
  const GameBoard({super.key});

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  

  //current tetris piece
  Piece currentPiece =Piece(type: Tetromino.L);

  @override
  void initState() {
    super.initState();
    //start the game when app start
    startGame();



  }


  void startGame(){
    currentPiece.initializePiece();

    //frame refresh rate
    Duration frameRate = const Duration(milliseconds: 400);
    gameLoop(frameRate);
  }

  void gameLoop(Duration frameRate){
    Timer.periodic(frameRate
    , (timer) {
      setState(() {
        //move current piece down
        currentPiece.moveTetris(Direction.Down);
      });
     });
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
            if(currentPiece.position.contains(index)){
              return Pixel(color: Colors.yellow,
            
              
              
              );
            }else{
              return Pixel(color: Colors.grey[900],);
            }
          }
          ),
    );
  }
}
