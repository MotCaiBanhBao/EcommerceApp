const express = require('express');
const bodyParser = require('body-parser')
const cors = require('cors')
const config = require('config')
const app = express()
app.use(express.json())
const authRouter = require('./routers/auth')
const cartRouter = require('./routers/cart')
const itemRouter = require('./routers/item')
const orderRouter = require('./routers/order')
const uploadRouter = require('./routers/upload')
const chatRouter = require('./routers/chat')
const notificationRouter = require('./routers/notification')

require("./service/cloudinary.config");

const PORT = config.get('port');
var port = process.env.PORT || PORT;


const db = require('./db')

var fileUpload = require("express-fileupload");

app.use(cors())
//Middleware

// Parse JSON bodies (as sent by API clients)
app.use(bodyParser.urlencoded({extended: true}))

app.use(bodyParser.json())
app.set('view engine', 'ejs');
app.use(fileUpload());


db.on('error', console.error.bind(console, 'Mongodb connection error'));
app.get('/', (req, res) => {
  res.send('Hello World')
})
app.use('/api', authRouter)
app.use('/api', cartRouter)
app.use('/api', itemRouter)
app.use('/api', orderRouter)
app.use('/api', chatRouter)
app.use('/file', uploadRouter)
app.use('/api', notificationRouter)
try {
app.listen(port, () => console.log('Server running on port ${apiPort}'))
}catch(err){
  console.log(err)
}