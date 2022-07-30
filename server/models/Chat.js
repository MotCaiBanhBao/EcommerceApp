const mongoose = require('mongoose');
const Schema = mongoose.Schema;


const ChatSchema = new Schema({
    member: [{type: String}],
});

module.exports = Chat = mongoose.model('chat', ChatSchema);