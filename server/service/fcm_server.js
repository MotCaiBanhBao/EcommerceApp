const axios = require('axios');
const User = require('../models/User')
const ChatNoti = require('../models/Notification/ChatNotification')
const ProductNoti = require('../models/Notification/ProductNotification')
const { default: mongoose } = require('mongoose');

module.exports = {
    pushNotification,
    pushChatNotification,
    pushUserProductNotification,
}
function pushNotification(topic, title, body) {
    const headers = {
        'Content-Type': 'application/json',
        'Authorization': 'key=AAAAcUSlFh4:APA91bEhugR3zJ9_JNDRxnN_H-R_jAijygsKt6JIFQveMblyvkBa7U8AH2lEju1DSjSgNJuCnmCgcFRVelHZLqIZ_hhflNQpq_rkqvjKGIBuo9qZ8nFTfpf00Ssdkq4wUV9f7X3okLa8'
    }

    return axios.post('https://fcm.googleapis.com/fcm/send', {
        "to": topic,
        "notification": {
            "title": title,
            "body": body
        },
        "android": {
            "priority": "high"
        }
    }, {
        headers: headers
    })
}

function pushUserProductNotification(userID, orderID, avatar, title, content) {
    return new Promise((resolve, reject) => {
        const newNotification = new ProductNoti({
            content: content,
            orderID: mongoose.Types.ObjectId(orderID),
            avatar: avatar
        });
        newNotification.save(function (err, result) {
            if (err) {
                reject(err);
            }
            Promise.all([pushNotification(`/topics/${userID}`, title, content),]).then((value) => {
                if (value[0].status == 200) {
                    User.findByIdAndUpdate(userID, { $push: { "order_notifications": result.id } }, { safe: true, upsert: true, new: true }, function (err, resultData) {
                        if (err) {
                            reject(err);
                        }
                        else {
                            resolve(resultData);
                        }
                    })
                }
                else {
                    reject(err);
                }
            })
        })

    })
}

function pushChatNotification(userID, anotherId, chatData, chatId) {
    return new Promise((resolve, reject) => {

        User.findById(userID, function (err, data) {
            if (err) {
                reject(err);
            }

            const newNotification = new ChatNoti({ chatID: chatId, content: `Bạn có tin nhắn mới từ ${data.name}`, anotherID: userID });
            newNotification.save(function (err, result) {
                if (err) {
                    reject(err);
                }
                Promise.all([pushNotification(`/topics/${anotherId}`, result.content, chatData),]).then((value) => {
                    if (value[0].status == 200) {
                        User.findByIdAndUpdate(anotherId, { $push: { "chat_notifications": result.id } }, { safe: true, upsert: true, new: true }, function (err, resultData) {
                            if (err) {
                                reject(err);
                            }
                            else {
                                resolve(resultData);
                            }
                        })
                    }
                    else {
                        reject(err);
                    }
                })
            })

        })
    })
}