const Order = require('../models/Order');
const User = require('../models/User');
const { pushNotification } = require('../service/fcm_server')
const ProductNoti = require('../models/Notification/ProductNotification');
const { pushUserProductNotification } = require('../service/fcm_server')
const Product = require('../models/Product')
// const stripe = require('stripe')(config.get('StripeAPIKey'));




module.exports.get_orders = async (req, res) => {
    const userId = req.user.id;
    Order.find({ "user_id": userId }).sort({ date: -1 }).exec(function (err, docs) {
        if (err) {
            res.status(400).json(err)
        }
        if(docs == null){
            res.status(400).json(err)
        }
        res.status(200).json(docs)
    })
}

module.exports.get_order = async (req, res) => {
    const { orderID } = req.body;
    Order.findById(orderID).exec(function (err, docs) {
        if (err) {
            res.status(400).json(err)
        }
        if(docs == null){
            res.status(400).json(err)
        }
        res.status(200).json(docs)
    })
}

module.exports.cancell = async (req, res) => {
    const userId = req.user.id;
    const { id, message } = req.body;
    Order.findOneAndUpdate({ "user_id": userId, "_id": id }, { 'status': 'Cancelled', 'is_called': true }, { new: true }).exec(function (err, docs) {
        if (err) {
            res.status(400).json(err)
        }
        if(docs == null){
            res.status(400).json(err)
        }
        docs.items.forEach(function(item){
            Product.findByIdAndUpdate(item.id, {$inc: {'cancell': 1}}).exec(function(err, ok){
                if(err){
                    res.status(400).jon(err)
                }
            })
          })
        pushUserProductNotification(docs.publisher_id, docs.id, docs.avatar, "Đơn hàng đã bị huỷ", `Đơn hàng mã ${docs._id} đẵ bị huỷ với lý do ${message}`).then((result) => {
            res.status(200).json(result)
        }).catch((err) => {
            res.status(400).json(err)
        })
    })
}

module.exports.confirmAndReview = async (req, res) => {
    const userID = req.user.id;
    try{
        Order.findOneAndUpdate({"_id": id }, { 'is_delivered': true, 'user_get_at': Date.now }, { new: true }).exec(function (err, docs) {
            if (err) {
                res.status(400).json(err)
            }
            if(docs == null){
                res.status(400).json(err)
            }
            pushUserProductNotification(docs.publisher_id, docs.id, docs.avatar, "Khách đã xác nhận nhận được hàng", `Đơn hàng mã ${docs._id} đã hoàn thành`).then((result) => {
                res.status(200).json(result)
            }).catch((err) => {
                res.status(400).json(err)
            })
        })
    }catch(err){
        res.status(400).json(err)
    }
    

}

module.exports.change_order_status = async (req, res) => {
    const publisher_id = req.user.id;
    const { id, status } = req.body;
    if (status === 'Processing') {
        Order.findOneAndUpdate({ "publisher_id": publisher_id, "_id": id }, { 'status': 'Processing', 'is_confirm': true }, { new: true }).exec(function (err, docs) {
            if (err) {
                res.status(400).json(err)
            }
            if(docs == null){
                res.status(400).json(err)
            }
            pushUserProductNotification(docs.user_id, docs.id, docs.avatar, "Đơn hàng đã được xác nhận", `Đơn hàng mã ${docs.id} đã được xác nhận`).then((result) => {
                res.status(200).json(result)
            }).catch((err) => {
                res.status(400).json(err)
            })
        })
    }
    else if (status === 'Shipping') {
        Order.findOneAndUpdate({ "publisher_id": publisher_id, "_id": id }, { 'status': 'Shipping' }, { new: true }).exec(function (err, docs) {
            if (err) {
                res.status(400).json(err)
            }
            if(docs == null){
                res.status(400).json(err)
            }
            pushUserProductNotification(docs.user_id, docs.id, docs.avatar, "Đơn hàng đang được giao hàng", `Đơn hàng mã ${docs._id} đang được giao hàng`).then((result) => {
                res.status(200).json(result)
            }).catch((err) => {
                res.status(400).json(err)
            })
        })
    }
    else if (status === 'Delivered') {
        Order.findOneAndUpdate({ "publisher_id": publisher_id, "_id": id }, { 'status': 'Delivered', 'delivered_at': Date.now() }, { new: true }).exec(function (err, docs) {
            if (err) {
                res.status(400).json(err)
            }
            if(docs == null){
                res.status(400).json(err)
            }
            console.log(docs.items)
            docs.items.forEach(function(item){
                Product.findByIdAndUpdate(item.id, {$inc: {'sold': 1}}).exec(function(err, ok){
                    if(err){
                        res.status(400).jon(err)
                    }
                })
              })
            pushUserProductNotification(docs.user_id, docs.id, docs.avatar,"Đơn hàng đã giao thành công", `Đơn hàng mã ${docs._id} đã giao thành công`).then((result) => {
                res.status(200).json(result)
            }).catch((err) => {
                res.status(400).json(err)
            })
        })
    }
}


module.exports.shop_get_order = async (req, res) => {
    const publisher_id = req.user.id;
    Order.find({ "publisher_id": publisher_id }).sort({ date: -1 }).exec(function (err, docs) {
        if (err) {
            res.status(400).json(err)
        }
        if(docs == null){
            res.status(400).json(err)
        }
        res.status(200).json(docs)
    })
}

module.exports.checkout = async (req, res) => {
    try {
        const userId = req.user.id;
        const { items, bill, shipping_address } = req.body;

        items.forEach(item => {
            const order = new Order({
                user_id: userId,
                publisher_id: item.publisher_id,
                items: item.items,
                bill: item.bill,
                shipping_address: shipping_address,
                avatar: item.avatar
            })
            console.log('run');
            Promise.all([order.save(async function (err, docs) {
                if (err) {
                    console.log('return 2')
                    res.status(400).json(`System err $err`)
                }
                console.log(`${docs.publisher_id}`)
                await pushNotification(`/topics/${docs.publisher_id}`, "Bạn có một đơn hàng ", `Bạn có một đơn hàng mã ${docs._id}.`)
            })])

        })

        Promise.all([pushNotification(`/topics/${userId}`, "Đơn hàng đang được xem xét", `Đơn hàng sẽ được phản hồi nhanh nhất có thể`)]).then(() => {
            res.status(200).json('ok');
        })
    }
    catch (err) {
        console.log(err);
        console.log('return 3')
        res.status(400).send("Something went wrong");
    }
}
