const Chat = require('../models/Chat');
const ChatNoti = require('../models/Notification/ChatNotification')
const { pushChatNotification } = require('../service/fcm_server')
const User = require('../models/User')



module.exports.getChatRoomId = async (req, res) => {
    const userId = req.user.id;
    const { anotherId } = req.body;

    try {
        Chat.findOne({
            $and: [
                {
                    member: userId
                }, {
                    member: anotherId
                }
            ]
        }, function (err, results) {
            if (results === null) {
                var newChat = new Chat()
                newChat.member.push(userId, anotherId)
                newChat.save(function (err, resultSave) {
                    if (err) {
                        res.status(400).send("Some thing wrong")
                    }
                    res.status(200).send({ 'room': resultSave.id, 'user': req.user.id })
                })
            }
            else {
                res.status(200).send({ 'room': results.id, 'user': req.user.id })
            }

        })
    }
    catch (err) {
        console.log(err);
        res.status(400).send("Something went wrong");
    }
}

module.exports.pushChat = async (req, res) => {
    const userId = req.user.id;
    const { anotherId, chatData, chatId } = req.body;
    try {
        pushChatNotification(userId, anotherId, chatData, chatId).then((resolve) => {
            res.status(200).json(resolve);
        }).catch((err) => {
            res.status(400).json(err);
        })

    }
    catch (err) {
        console.log(err);
        res.status(400).send(err);
    }
}