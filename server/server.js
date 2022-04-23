const express = require('express');
const bodyParser = require('body-parser')
const cors = require('cors')
const db = require('./db')
const config = require('config')

const app = express()
app.use(express.json())

const authRouter = require('./routers/auth')
const cartRouter = require('./routers/cart')
const itemRouter = require('./routers/item')
const orderRouter = require('./routers/order')
const PORT = config.get('port');
var port = process.env.PORT || 3000;

app.use(express.json()); 
app.use(bodyParser.urlencoded({extended: true}))
app.use(cors())
app.use(bodyParser.json())

db.on('error', console.error.bind(console, 'Mongodb connection error'))

app.get('/', (req, res) => {
  res.send('Hello World')
})

app.use('/api', authRouter)
app.use('/api', cartRouter)
app.use('/api', itemRouter)
app.use('/api', orderRouter)

app.listen(port, () => console.log('Server running on port ${apiPort}'))