import 'package:flutter/widgets.dart';
import 'package:tic_tac_toe/resources/socket_client.dart';

class SocketMethods {
  final _socketClient = SocketClient.instance.socket!;
  void createRoom(String name) {
    if (name.isNotEmpty) {
      _socketClient.emit("createRoom", {"nickname": name});
    }
  }

  void createRoomSuccessListener(BuildContext context) {
    _socketClient.on('createRoomSuccess', (room) {
      Navigator.pushNamed(context, '/game');
    });
  }
}
