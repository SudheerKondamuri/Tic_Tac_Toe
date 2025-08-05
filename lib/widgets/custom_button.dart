import 'package:flutter/material.dart';
import 'package:tic_tac_toe/utils/colors.dart';

class CustomButton extends StatelessWidget {
  final String name;
  final VoidCallback onTap;
  const CustomButton({super.key, required this.name, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: buttonColor, blurRadius: 5, spreadRadius: 0),
        ],
      ),
      child: ElevatedButton(
        onPressed: onTap,

        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(8),
          ),
          backgroundColor: buttonColor,
          minimumSize: Size(width, 50),
        ),
        child: Text(name),
      ),
    );
  }
}
