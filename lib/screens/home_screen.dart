import 'package:flutter/material.dart';
import 'package:tic_tac_toe/responsive/responsive.dart';
import 'package:tic_tac_toe/widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                name: "Create  Room",
                onTap: () {
                  Navigator.pushNamed(context, "/create-room");
                },
              ),
              CustomButton(
                name: "Join   Room",
                onTap: () {
                  Navigator.pushNamed(context, "/join-room");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
