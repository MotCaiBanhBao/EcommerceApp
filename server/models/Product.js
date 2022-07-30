const mongoose = require('mongoose');
const Schema = mongoose.Schema;
require('./Shop')
require('./User')

const ProductSchema = new Schema({
    title: {
        type: String,
        default: '',
        required: true
    },
    avatar: {
        type: String,
        required: true
    },
    product_image: [String],
    description: {
        type: String,
        required: true
    },
    category:
        { type: Schema.Types.ObjectId, ref: 'category' },

    sub_category: [{ type: Schema.Types.ObjectId, ref: 'category' },],

    price: {
        type: Number,
        required: true
    },
    date_added: {
        type: Date,
        default: Date.now
    },
    publisher: { type: Schema.Types.ObjectId, ref: 'shop' },
    address: {
        id: String
    },

    variations: {
        list_variation: [
            {
                variation_name: {
                    type: String,
                },
                variation_data: [
                    {
                        name: String,
                        product_image: String,
                    }
                ]
            }
        ],

        combineData: [{
            nameOfvariation: [String],
            combine: [String],
            price: Number,
            stock: Number,
        }]
    },

    stock: {
        type: Number,
        required: true,
    },
    sold: {
        type: Number,
        default: 0,
    },
    cancell: {
        type: Number,
        default: 0,
    },
    shipping_details: {
        weight: String,
        width: String,
        height: String,
        depth: String
    },
    rate: {
        totalRate: {
            type: Number,
            default: 5,
        },
        history: {
            numberOfReview: {
                type: Number,
                default: 0
            },
            data: [
                {
                    rate: Number,
                    comment: String,
                    id: { type: Schema.Types.ObjectId, ref: 'user' }
                }
            ]
        }
    }
});
ProductSchema.index({ title: 'text' },);
module.exports = Item = mongoose.model('product', ProductSchema);
