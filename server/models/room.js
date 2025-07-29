const mongoose = require("mongoose")
const playerSchema = require("./player")

const roomSchema = new mongoose.Schema({
    occupancy: {
        type: Number,
        default:2
    },
    maxRounds:{
        type: Number,
        defualt: 6
    },
    currentRound:{
        required: true,
        type: Number,
        default: 1
    },
    players:[playerSchema],
    isJoin:{
        type: Boolean,
        defualt: true
    },
    turn: playerSchema,
    turnIndex:{
        type: Number,
        defualt: 0
    }

});
const roomModel = mongoose.model('Room',roomSchema);
 module.exports = roomModel