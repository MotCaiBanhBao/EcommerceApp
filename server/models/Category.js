const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const CategorySchema = new Schema({
    name: {
        type: String,
        unique: true,
        required: true
    },
    desc: {
        type: String,
        require: false
    }
})

module.exports = Category = mongoose.model('category', CategorySchema);