const mongoose = require('mongoose');
const Schema = mongoose.Schema;
const Item = require('./Item');

const ShopSchema = new Schema({
    shopName: {
        type: String,
        required: true
    },
    desc: String,
    register_date: {
        type: Date,
        default: Date.now
    },
    member: [String],
    product: [Item],

    pendingProduct: [{
        idProduct: String,
        idUser: String,
        userRequest: String,
        data: [{
            quantity: {
                type: String,
                default: 1
            },
            color: {
                type: String,
                default: ''
            }
        }]
    }],
    
    productSold: [{
        idProduct: String,
        dateSold: {
            type: Date,
            default: Date.now
        },
        price: String,
    }],
    shopRating: Number,
})

module.exports = Shop = mongoose.model('shop', ShopSchema);