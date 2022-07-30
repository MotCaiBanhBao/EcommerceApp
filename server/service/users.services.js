const otpGenerator = require('otp-generator')
const crypto = require("crypto")
const config = require('config')
const key = config.get('otp-secret-key');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');
const User = require('../models/User');


module.exports = {
    createOtp,
    verifyOTP
}


async function createOtp(params, callback){
    const otp = otpGenerator.generate(4, {
        lowerCaseAlphabets: false,
        specialChars: false,
        upperCaseAlphabets: false,
        digits: true
    })

    const ttl = 5*60*1000
    const expires = Date.now() + ttl;
    const data = `${params.email}.${otp}.${expires}`;
    const hash = crypto.createHmac("sha256", key).update(data).digest("hex")
    const fullHash = `${hash}.${expires}`;

    console.log(`Your OTP is ${otp}`)
    
    //SEND SMS
    return callback(null, fullHash, otp)
}

async function verifyOTP(params, callback){
    console.log("A")
    let [hashValue, expires] = params.hash.split('.');
    console.log("b")
    let now = Date.now()
    if(now > parseInt(expires)) return callback(null, "OTP Expired", "expired")
    console.log("c")
    let data = `${params.email}.${params.otp}.${expires}`

    let newCalculateHash = crypto.createHmac("sha256", key).update(data).digest("hex")

    console.log(newCalculateHash)
    console.log(hashValue)

    if(newCalculateHash === hashValue){ 
        let email = params.email
        console.log('d')
        console.log(email)
        User.findOne({email}).then(user => {
            console.log(user.email)
            jwt.sign(
                {id: user._id, is_shop: user.isShop},
                config.get('jwtsecret'),
                {expiresIn: '1y'},
                (err, token) => {
                    return callback(null, {
                        token,
                        user: {
                            id: user._id,
                            name: user.name,
                            avatar: user.avatar,
                            email: user.email,
                            isShop: user.isShop,
                        }
                    }, "Success")
                }
            )
        })
    }
    else{
        return callback(null ,"Invalid OTP", "invalid")
    }

    
}
