import 'package:flutter/material.dart';
import 'package:tic_tac_toe/responsive/responsive.dart';
import 'package:tic_tac_toe/widgets/custom_button.dart';
import 'package:tic_tac_toe/widgets/custom_text.dart';
import 'package:tic_tac_toe/widgets/custom_textfield.dart';

class JoinRoomScreen extends StatefulWidget {
  const JoinRoomScreen({super.key});

  @override
  State<JoinRoomScreen> createState() => _JoinRoomScreenState();
}

class _JoinRoomScreenState extends State<JoinRoomScreen> {
  final _nameCtrl = TextEditingController();
  final _idCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 20,
          children: [
            CustomText(shadows: [], text: "Join Room", fontSize: 40),
            CustomTextField(controller: _nameCtrl, hintText: "Enter Nickname"),
            CustomTextField(controller: _idCtrl, hintText: "Enter Room Id"),
            CustomButton(name: "Enter Room", onTap: () {}),
          ],
        ),
      ),
    );
  }
}
