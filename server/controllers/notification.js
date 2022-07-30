const Chat = require('../models/Chat');
const ChatNoti = require('../models/Notification/ChatNotification')
const { pushNotification } = require('../service/fcm_server')
const User = require('../models/User')

module.exports.getNotification = async (req, res) => {
    const userId = req.user.id;
    // const { anotherId } = req.body;

    try {
        User.findById(userId).populate({ path: 'chat_notifications', select: '-_id' }).populate({ path: 'order_notifications', select: '-_id' }).select('order_notifications chat_notifications -_id').exec(function (err, docs) {
            if (err) {
                res.status(400).json(err)
            }

            res.status(200).json(docs);
        })
    }
    catch (err) {
        console.log(err);
        res.status(400).send("Something went wrong");
    }
}

module.exports.make_chat_noti_watched = async (req, res) => {
    const { notificationID } = req.body;
    try {
        ChatNoti.findByIdAndUpdate(notificationID, { 'is_watched': true }).exec(function (err, docs) {
            if (err) {
                res.status(400).json(err)
            }

            res.status(200).json(docs);
        })
    }
    catch (err) {
        console.log(err);
        res.status(400).send("Something went wrong");
    }

}