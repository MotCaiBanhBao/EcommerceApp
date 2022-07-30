const mongoose = require('mongoose');
const Schema = mongoose.Schema;
require('./Product')
require('./Shop')
require('./User')

const OrderSchema = new Schema({
    user_id: {
        type: Schema.Types.ObjectId, ref: 'user',
        required: true,
    },
    avatar: {
        type: String,
    },
    publisher_id: {
        type: Schema.Types.ObjectId, ref: 'shop',
        required: true
    },
    items: [
        {
            product_id: {
                type: Schema.Types.ObjectId, ref: 'product'
            },
            name: String,
            quantity: {
                type: Number,
                required: true,
                min: [1, 'Quantity can not be less then 1.']
            },
            price: String,
            variation_data: {
                type: String
            },
        }
    ],
    bill: {
        type: String,
        required: true
    },
    is_delivered: {
        type: Boolean,
        required: true,
        default: false
    },
    is_confirm: {
        type: Boolean,
        required: true,
        default: false
    },
    is_called: {
        type: Boolean,
        required: true,
        default: false
    },
    delivered_at: {
        type: Date
    },
    status: {
        type: String,
        default: 'Not Processed',
        enum: ['Not Processed', 'Processing', 'Shipping', 'Delivered', 'Cancelled']
    },
    user_get_at: {
        type: Date
    },
    shipping_address: {
        address: { type: String, required: true },
        phone_number: {
            type: String,
            required: true,
        },
    },
    date_added: {
        type: Date,
        default: Date.now
    }
})

module.exports = Order = mongoose.model('order', OrderSchema);