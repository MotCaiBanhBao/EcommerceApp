const mongoose = require('mongoose')
require('dotenv').config()
const config = require('config')
const dbURI = config.get('dbURI')


mongoose.connect(dbURI, {useUnifiedTopology: true, useNewUrlParser: true,
  useUnifiedTopology: true,
}).catch(e => {
  console.error('Connection error', e.message)
})
const db = mongoose.connection

module.exports = db
