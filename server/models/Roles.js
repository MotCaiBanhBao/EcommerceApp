const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const RolesSchema = new Schema({
    role: String
})

module.exports = Roles = mongoose.model('roles', RolesSchema);