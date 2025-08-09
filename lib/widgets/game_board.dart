import 'package:flutter/material.dart';
import 'package:tic_tac_toe/utils/colors.dart';

class GameBoard extends StatelessWidget {
  final List<String> board; // Should be a list of 9 elements: '', 'X', or 'O'
  final void Function(int index) onTap; // Called when a cell is tapped

  const GameBoard({super.key, required this.board, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GridView.builder(
          itemCount: 9,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => onTap(index),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  color: Colors.grey[200],
                ),
                alignment: Alignment.center,
                child: Text(
                  board[index],
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: board[index] == 'X' ? buttonColor : Colors.red,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
