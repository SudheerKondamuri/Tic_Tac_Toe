import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/screens/create_room_screen.dart';
import 'package:tic_tac_toe/screens/game_screen.dart';
import 'package:tic_tac_toe/screens/home_screen.dart';
import 'package:tic_tac_toe/screens/join_room_screen.dart';
import 'package:tic_tac_toe/utils/colors.dart';

void main() async {
  runApp(DevicePreview(builder: (_) => MyApp())  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Tic Tac Toe",
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: bgColor),

      routes: {
        "/home": (context) => HomeScreen(),
        "/create-room": (context) => CreateRoomScreen(),
        "/join-room": (context) => JoinRoomScreen(),
        "/game": (context) => GameScreen()
      },
      initialRoute: "/home",
    );
  }
}
