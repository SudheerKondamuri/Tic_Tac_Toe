import 'package:flutter/material.dart';
import 'package:tic_tac_toe/resources/socket_methods.dart';
import 'package:tic_tac_toe/responsive/responsive.dart';
import 'package:tic_tac_toe/widgets/custom_button.dart';
import 'package:tic_tac_toe/widgets/custom_text.dart';
import 'package:tic_tac_toe/widgets/custom_textfield.dart';

class CreateRoomScreen extends StatefulWidget {
  const CreateRoomScreen({super.key});

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  @override
  void initState() {
    super.initState();
    SocketMethods().createRoomSuccessListener(context);
  }

  final _nameCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 20,
          children: [
            CustomText(shadows: [], text: "Create Room", fontSize: 40),
            CustomTextField(controller: _nameCtrl, hintText: "Enter Nickname"),

            CustomButton(
              name: "Create Room",
              onTap: () {
                SocketMethods().createRoom(_nameCtrl.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
