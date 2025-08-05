const express = require("express");
const http = require("http");
const mongoose = require("mongoose");
const Room = require("./models/room.js");

const port = process.env.PORT || 3000;
const app = express();

var server = http.createServer(app);

const io = require("socket.io")(server, {
  cors: {
    origin: "*",
    methods: ["GET", "POST"],
  },
});

app.use(express.json());

const DB =
  "mongodb+srv://sudheer:test123@cluster0.newjoh1.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0";
io.on("connection", (socket) => {
  console.log(socket.id);

  socket.on("createRoom", async ({ nickname }) => {
    console.log(nickname);
    try {
      let room = new Room();
      let player = {
        socketId: socket.id,
        nickname: nickname,
        playerType: "X",
      };
      room.players.push(player);
      room.turn = player;
      room = await room.save();
      console.log(room);
      const roomId = room._id.toString();
      console.log(roomId);
      socket.join(roomId);
      io.to(roomId).emit("createRoomSuccess", room);
    } catch (e) {
      console.log(e);
    }
  });
  socket.on("joinRoom", async ({ nickname, roomId }) => {
    try {
      if (!roomId.match(/^[0-9a-fA-F]{24}$/)) {
        socket.on(roomId).emit("invalidRoomId", "Please enter a valid room id");
        return;
      }
      let room = await Room.findById(roomId);
      if (!room) {
        socket.emit("roomNotFound", "Room does not exist!");
        return;
      }
      const player = {
        socketId: socket.id,
        nickname: nickname,
        playerType: "O",
      };
      room.players.push(player);
      room = await room.save();
      socket.join(roomId);
      io.to(roomId).emit("playerJoined", room);
      io.to(roomId).emit("updatedplayers", room.players);
      console.log("joined");
    } catch (e) {
      console.log(e);
    }
    console.log("joined");
  });
});

mongoose
  .connect(DB)
  .then(() => {
    console.log("Connection to mongo DB is succesful");
  })
  .catch((e) => {
    console.log(e);
  });

server.listen(port, "0.0.0.0", () => {
  console.log("Server is created and running " + port);
});
//console.log("hil");
  