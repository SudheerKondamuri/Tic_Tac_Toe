import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/model/players_model.dart';
import 'package:tic_tac_toe/provider/room_data_provider.dart';
import 'package:tic_tac_toe/resources/socket_client.dart';

class SocketMethods {
  final _socketClient = SocketClient.instance.socket!;
  void createRoom(String name) {
    if (name.isNotEmpty) {
      _socketClient.emit("createRoom", {"nickname": name});
    }
  }

  void joinRoom(String name, String id) {
    if (name.isNotEmpty && id.isNotEmpty) {
      _socketClient.emit("joinRoom", {"nickname": name, "roomId": id});
    }
  }

  void createRoomSuccessListener(BuildContext context) {
    _socketClient.on('createRoomSuccess', (room) {
      Provider.of<RoomDataProvider>(
        context,
        listen: false,
      ).updateRoomData(room);
      Navigator.pushNamed(context, '/game');
    });
  }

  void joinRoomListener(BuildContext context) {
    _socketClient.on('playerJoined', (room) {
      Provider.of<RoomDataProvider>(
        context,
        listen: false,
      ).updateRoomData(room);
      _socketClient.on('updatedPlayers',(players){
        
      });
      Navigator.pushNamed(context, '/game');
    });
  }
}
