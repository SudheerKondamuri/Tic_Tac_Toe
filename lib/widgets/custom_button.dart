import 'package:flutter/material.dart';

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
          BoxShadow(color: Colors.blue, blurRadius: 5, spreadRadius: 0),
        ],
      ),
      child: ElevatedButton(
        onPressed: onTap,

        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(8),
          ),
          backgroundColor: Colors.blue,
          minimumSize: Size(width, 50),
        ),
        child: Text(name),
      ),
    );
  }
}
