const mongoose = require('mongoose');
const Schema = mongoose.Schema;
const { isEmail } = require('validator');
require('../models/Roles');
require('../models/Category')
require('../models/Shop')
require('../models/Notification/ChatNotification')
require('../models/Order')
require('../models/Notification/ProductNotification')

const UserSchema = new Schema({
    name: {
        type: String,
        required: true
    },
    noti_topics: [{
        type: String,
    }],
    isShop: {
        type: Boolean,
        default: false
    },
    avatar: {
        type: String,
        default: 'https://res.cloudinary.com/luongvany/image/upload/v1656900571/Users/default_avatar_image.png',
        required: true
    },
    email: {
        type: String,
        required: [true, 'Please enter an email'],
        unique: true,
        lowercase: true,
        validate: [isEmail, 'Please enter a valid email']
    },
    password: {
        type: String,
        required: [true, 'Please enter a valid password'],
        minlength: [6, 'Minimum password length must be 6 characters']
    },
    register_date: {
        type: Date,
        default: Date.now
    },
    chat_notifications: [ {type: Schema.Types.ObjectId, ref: 'chat_notification'}],
    order_notifications: [{type: Schema.Types.ObjectId, ref: 'order_notification'}],
    user_role: {
        type: Schema.Types.ObjectId, ref: 'roles', default: mongoose.Types.ObjectId('62c2e457399854f15bacca88')
    },
    rate_history: [{
        productID: {
            type: Schema.Types.ObjectId, ref: 'product'
        },
        myRate: Number,
    }
    ],
    phone: {
        type: String,
    },
    address: {
        type: String,
    },
    favorite_cate: [{
        type: Schema.Types.ObjectId, ref: 'category'
    }],
    update_at: {type: Date},
    user_order: [{
        type: Schema.Types.ObjectId, ref: 'order'
    }],
    favorite_item: [{ type: Schema.Types.ObjectId, ref: 'product' }],
    shopID: { type: Schema.Types.ObjectId, ref: 'shop' }
})

module.exports = User = mongoose.model('user', UserSchema);