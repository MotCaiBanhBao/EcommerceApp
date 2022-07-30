const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const DefaultVariation = new Schema({
    nameOfVariation: String,
    variationsData: [
        {
            name: String, 
            image: String,
        }
    ]
});


module.exports = Cart = mongoose.model('variation', DefaultVariation);