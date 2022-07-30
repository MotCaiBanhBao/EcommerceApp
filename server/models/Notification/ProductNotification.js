const mongoose = require('mongoose');
const Schema = mongoose.Schema;
require('../Order')

const OrderNotiSchema = new Schema({
    content: {type: String},
    orderID: { type: Schema.Types.ObjectId, ref: 'order'},
    is_watched: {
        type: Boolean,
        default: false
    },
    dateAdd: {type: Date,
        default: Date.now},
    avatar: String,
});

module.exports = ProductNoti = mongoose.model('order_notification', OrderNotiSchema);