const mongoose = require('mongoose');
const Schema = mongoose.Schema;
require('../Chat')

const ChatNotiSchema = new Schema({
    content: {type: String},
    chatID: { type: String},
    anotherID: {type: String},
    is_watched: {
        type: Boolean,
        default: false
    },
    dateAdd: {type: Date,
        default: Date.now}
});

module.exports = ChatNoti = mongoose.model('chat_notification', ChatNotiSchema);