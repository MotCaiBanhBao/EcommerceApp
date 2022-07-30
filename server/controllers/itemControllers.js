const Product = require('../models/Product')
const { upload_one } = require('../service/cloudinary.upload')
const mongoose = require('mongoose')
const Category = require('../models/Category')
const { createCloudinaryOption } = require('../utils/utils')
const { schema } = require('../models/Category')
const Shop = require('../models/Shop')
const selectField = '_id title avatar rate.totalRate rate.history.numberOfReview address price sold stock'
const axios = require('axios');
const User = require('../models/User')
const Order = require('../models/Order')
module.exports.get_items = (req, res) => {
    Product.find().select(selectField).sort({ date: -1 }).then(items => res.json(items));
    // Item.find().sort({date:-1}).explain("executionStats").then(items => res.json(items));
}
    

module.exports.push_categories = (req, res) => {
    let categories = req.body

    Category.insertMany(categories).then(function (docs) {
        res.json(docs);
    })
        .catch(function (err) {
            res.status(500).send(err);
        });
}


module.exports.get_all_shop_item = (req, res) => {
    let shopID = req.user.id

    Shop.findById(shopID).populate({ path: 'product'}).select('product -_id').exec(function(err, docs){
        if(err){
            res.status(400).json(err)
        }
        if(docs === null){
            res.status(400).json('null')
        }
        res.status(200).json(docs)
    })
}



module.exports.is_favorite = (req, res) => {
    const userId = req.user.id;
    const { productID } = req.body;
    try{
        User.findById(userId, 'favorite_item -_id', function (err, data) {
            if (err) {
                res.status(400).json(err)
            }
            var test = data.favorite_item.some(function (id) {
                return id.equals(productID)
            })
    
            res.status(200).json(test)
        })
    }
    catch(err){
        res.status(400).json(200);
    }
    
    // User.findById(userId, 'favorite_item, -_id', function(err, data){
    //     if(err){
    //         res.status(400).json(err)
    //     }
    //     res.status(200).json(data)
    // })
}

module.exports.un_favorite = (req, res) => {
    const { productID } = req.body
    User.updateOne({ _id: req.user.id }, { $pull: { "favorite_item": mongoose.Types.ObjectId(productID) } }).exec(function (err, data) {
        if (err) {
            res.status(400).json(err)
        }
        res.status(200).json(data)
    })
}

module.exports.make_favorite = (req, res) => {
    try {
        const { productID } = req.body
        const userId = req.user.id;
        User.findByIdAndUpdate({'_id': userId}, {
            $push: { 'favorite_item': mongoose.Types.ObjectId(productID) }
        }, {safe: true, upsert: true, new : true}, function(err, model) {
            if (err) {
                res.status(400).json(err)
            }
            res.status(200).json(model)
        })
    }
    catch (err) {
        res.status(400).json('err')
    }

}

module.exports.test1 = (req, res) => {
    const productImage = req.files.productImage
    console.log(productImage)
}

module.exports.get_item_by_id = (req, res) => {
    const productId = req.params.id;
    Product.findById(productId).then(items => res.json(items));
}


module.exports.find_item = (req, res) => {
    const { findData } = req.body;
    console.log(findData)
    // Item.find({$or: [{$te: {$regex: '.*' + findData + '.*' }} ,{$text: {$search: findData}}]}).sort({date:-1}).then((items, error) => res.json(items));
    Product.find({ $text: { $search: `i/${findData}/` } }).select(selectField).sort({ date: -1 }).then(items => res.json(items))
}


module.exports.post_item = async (req, res) => {
    try {
        const avatar = req.files.avatar
        const productImage = req.files.productImage
        const address = req.body.address
        const title = req.body.title
        const description = req.body.description
        const price = req.body.price
        const stock = req.body.stock
        const category = req.body.category
        const variations = req.body.variations
        const shipping_details = req.body.shipping_details
        // console.log(pictureFiles.length)
        //Check if files exist

        var id = mongoose.Types.ObjectId();

        if (!avatar || !productImage)
            return res.status(400).json({ message: "No picture attached!" });


        let multiplePicturePromise = productImage.map((picture) =>
            upload_one(picture.data, createCloudinaryOption(productImage.indexOf(picture), `Product/${id}/image`)));
        // await all the cloudinary upload functions in promise.all, exactly where the magic happens
        await Promise.all([await Promise.all(multiplePicturePromise), upload_one(avatar.data, createCloudinaryOption(id, `Product/${id}/avatar`))]).then(async (value) => {
            const newItem = new Product({
                _id: id,
                'avatar': value[1].url,
                'product_image': value[0].map((item) => item.url),
                'title': title, 'description': description, 'price': price,
                'publisher': mongoose.Types.ObjectId(req.user.id),
                'variations': variations,
                'category': mongoose.Types.ObjectId(category), 'address': address, 'stock': stock, 'shipping_details': shipping_details
            });
            newItem.save()

            const shop = await Shop.findById(req.user.id)
            shop.product.push(newItem)
            shop.save()
        })

        res.status(200).json({ msg: 'good' })

    } catch (err) {
        res.status(400).json({
            message: err.message,
        });
    }

}

module.exports.test = async (req, res) => {
    const shop = await Shop.findById(req.user.id)
    var id = mongoose.Types.ObjectId('62c8153b3d6ae79e092bb28a'
    );
    var id2 = mongoose.Types.ObjectId('62c973666534867684706b83')
    shop.product.push(id)
    shop.product.push(id2)
    shop.save()

}

module.exports.send_comment = async (req, res) => {
    const userID = req.user.id
    const { comment, star, itemID } = req.body;

    Product.findByIdAndUpdate({ _id: itemID }, { $push: { 'rate.history.data': { rate: star, comment: comment, senderId: userID } }, id: userID }, function (err, docs) {
        if (err) {
            console.log(err)
            res.status(404).json({
                success: false,
                msg: err
            })
        }
        else {
            res.status(200).json({
                success: true,
                msg: docs
            })
            Product.aggregate([{ $match: { _id: mongoose.Types.ObjectId(itemID) } }, {
                $addFields: {
                    'rate.totalRate': { $avg: '$rate.history.data.rate' }, 'rate.history.numberOfReview': { $size: '$rate.history.data.rate' }
                }
            }]).then((items) => {
                var data = new Product(items[0])
                Product.updateOne({ _id: mongoose.Types.ObjectId(itemID) }, data, function (err, docs) {
                    console.log(docs)
                })
            }
            )
        }
    }
    )
}


module.exports.update_item = async (req, res) => {
    const update = req.body
    console.log(update)
    Product.findByIdAndUpdate({ _id: req.params.id }, update).then(function (item) {
        Product.findOne({ _id: req.params.id }).then(function (item) {
            res.json(item);
        });
    });
    console.log("All done")
}

module.exports.delete_item = (req, res) => {
    Product.findByIdAndDelete({ _id: req.params.id }, function(err, docs){
        if(err){
            res.status(400).json(err)
        }
        res.status(200).json({ success: true });
    })
}