import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/provider/room_data_provider.dart';
import 'package:tic_tac_toe/responsive/responsive.dart';
import 'package:tic_tac_toe/widgets/game_board.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  handleTap(int index) {
    final provider = Provider.of<RoomDataProvider>(context, listen: false);
    final board = provider.board;
    final currentPlayer = provider.currentPlayer;
    if (board[index] == "") {
      board[index] = currentPlayer;
      provider.updateBoard(board);
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RoomDataProvider>(context);
    List<String> board = provider.board;
    return Scaffold(
      body: Center(
        child: Responsive(
          child: GameBoard(
            board: board,
            onTap: (i) {
              handleTap(i);
            },
          ),
        ),
      ),
    );
  }
}
