const mongoose = require('mongoose');
const Schema = mongoose.Schema;
require('./Product');
require('./User');

const ShopSchema = new Schema({
    shop_name: {
        type: String,
        required: true
    },
    address: {
        type: String,
    },
    phone_number: {
        type: String
    },
    desc: String,
    register_date: {
        type: Date,
        default: Date.now
    },
    product: [{ type: Schema.Types.ObjectId, ref: 'product' },],
    pending_order: [{
        type: Schema.Types.ObjectId, ref: 'order'
    }],
    
    product_sold: [{
        idProduct: String,
        dateSold: {
            type: Date,
            default: Date.now
        },
        price: String,
    }],
    shop_rating: Number,
})

module.exports = Shop = mongoose.model('shop', ShopSchema);