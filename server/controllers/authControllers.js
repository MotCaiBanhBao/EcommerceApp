const User = require('../models/User');
const jwt = require('jsonwebtoken');
const config = require('config');
const bcrypt = require('bcrypt');
const userService = require('../service/users.services')
const { upload_one } = require('../service/cloudinary.upload')
var nodemailer = require('nodemailer');
const Shop = require('../models/Shop');
const { default: mongoose } = require('mongoose');
const selectField = 'avatar'

module.exports.get_another_user = async (req, res) => {
    const {userID} = req.body
    User.findById(userID)
    .populate(
        {
            path: 'user_role',
        }
    )
    .select('-password')
    .then(user => res.json(user));
}

module.exports.test = async (req, res) => {
    const shopID = req.user.id;

    Shop.findByIdAndUpdate(shopID, { $push: { 'product': mongoose.Types.ObjectId('62c973666534867684706b83') } }, { safe: true, upsert: true, new: true }, function (err, docs) {
        if (err) {
            res.status(400).json(err)
        }
        if (docs === null) {
            res.status(400).json('null')
        }
        res.status(200).json(docs)
    })
}
module.exports.getShopData = async (req, res) => {
    const shopID = req.user.id;

    Shop.findById(shopID, function (err, docs) {
        if (err) {
            res.status(400).json(err)
        }
        if (docs === null) {
            res.status(400).json('null')
        }
        res.status(200).json(docs)
    })
}


module.exports.signup = (req, res) => {
    const { email, password } = req.body;

    if (!email || !password) {
        res.status(400).json({ msg: 'Please enter all fields' });
    }

    User.findOne({ email }).then(user => {
        if (user) return res.status(400).json({ msg: 'User already exists' });

        const newUser = new User({ name: email, email: email, password: password, });

        bcrypt.genSalt(10, (err, salt) => {
            bcrypt.hash(password, salt, (err, hash) => {
                if (err) throw err;
                newUser.password = hash;
                newUser.save().then(user => {
                    jwt.sign(
                        { id: user._id },
                        config.get('jwtsecret'),
                        { expiresIn: '1y' },
                        (err, token) => {
                            if (err) { res.status(400).json(err) }
                            res.status(200).json({
                                token, user: {
                                    id: user._id,
                                    name: user.name,
                                    email: user.email,
                                    isShop: user.isShop
                                }
                            })
                        }
                    )
                })
            })
        })
    })
}

module.exports.getUserAvatar = (req, res) => {
    const { userID } = req.body;

    User.findById(userID, selectField, function (err, docs) {
        if (err) {
            res.status(400).json(err)
        }
        res.status(200).json(docs.avatar)
    })
}

module.exports.shopRegistration = (req, res) => {
    const { phoneNumber, address, shopName } = req.body;

    if (!phoneNumber || !address || !shopName) {
        res.status(400).json({ msg: 'Please enter all fields' });
    }

    Shop.findOne({ shop_name: shopName }).then(shop => {
        if (shop) return res.status(400).json({ msg: 'Shop already exists' });
        const newShop = new Shop({ shop_name: shopName, address: address, phone_number: phoneNumber, _id: mongoose.Types.ObjectId(req.user.id) });
        newShop.save(function (err) {
            if (err) return res.status(400).json({ msg: err })
            User.findByIdAndUpdate(req.user.id, { shopID: newShop._id, isShop: true, user_role: mongoose.Types.ObjectId("62c2e4aa399854f15bacca89") }, function (err, docs) {
                if (err) {
                    res.status(400).json({ msg: err });
                }
                else {
                    res.status(200).json({ msg: true })
                }
            })
        })
    });
}

module.exports.login = async (req, res) => {
    const { email, password } = req.body;
    if (!email || !password) {
        res.status(400).json({ msg: 'Please enter all fields' });
    }

    User.findOne({ email }).then(user => {
        if (!user) return res.status(400).json({ msg: 'User does not exist' })

        //Validate password
        bcrypt.compare(password, user.password).then(isMatch => {
            if (!isMatch) return res.status(400).json({ msg: 'Invalid credentials' })
            jwt.sign(
                { id: user._id, is_shop: user.isShop },
                config.get('jwtsecret'),
                { expiresIn: '1y' },
                (err, token) => {
                    if (err) throw err
                    res.json({
                        token,
                        user: {
                            id: user._id,
                            name: user.name,
                            email: user.email
                        }
                    })
                }
            )
        })
    })
}

module.exports.resetPassword = async (req, res) => {
    const userID = req.user.id;
    const { oldPassword, password } = req.body;

    console.log(userID)

    User.findById(userID).then(user => {
        if (!user) return res.status(400).json({ msg: 'User does not exist' })

        //Validate password
        bcrypt.compare(oldPassword, user.password).then(isMatch => {
            if (!isMatch) return res.status(400).json({ msg: 'Invalid credentials' })
            bcrypt.genSalt(10, (err, salt) => {
                bcrypt.hash(password, salt, (err, hash) => {
                    if (err) throw err;
                    User.findByIdAndUpdate(userID, {'password': hash}).exec(function(err, docs){
                        if(err){
                            res.status(400).json(err)
                        }
                        else{
                            res.status(200).json(docs)
                        }
                    })
                })
            })

        })
    })
}


module.exports.uploadAvatar = async (req, res) => {
    try {
        
        const id = req.user.id
        let pictureFiles = req.files.avatar;
        
        const options = {
            use_filename: true,
            unique_filename: false,
            overwrite: true,
            public_id: `avatar`,
            format: 'jpg',
            folder: `User/${id}`
        };

        console.log(pictureFiles)

        if (!pictureFiles)
            return res.status(400).json({ message: "No picture attached!" });

        upload_one(pictureFiles.data, options).then((value) => {
            User.findByIdAndUpdate(id, { avatar: value.url }, function (err, docs) {
                if (err) {
                    res.status(400).json(err)
                }
                else {
                    res.status(200).json(docs)
                }
            })
        })

    } catch (err) {
        res.status(400).json('loi roi')
    }
}

module.exports.get_user = (req, res) => {
    User.findById(req.user.id)
        .populate(
            {
                path: 'user_role',
            }
        )
        .select('-password')
        .then(user => res.json(user));
}

module.exports.otpLogin = (req, res) => {

    const { email, password } = req.body;
    if (!email || !password) {
        return res.status(400).json({ msg: 'Please enter all fields' });
    }

    User.findOne({ email }).then(user => {
        if (!user) return res.status(400).json({ msg: 'User does not exist' })

        //Validate password

        userService.createOtp(req.body, (error, results, otp) => {
            if (error) {
                return res.status(400).send({ message: "Error", data: error })
            }
            bcrypt.compare(password, user.password).then(isMatch => {
                if (!isMatch) {
                    console.log("RRRR");
                    return res.status(400).send({ msg: 'Invalid credentials' })
                }
                else {
                    var transporter = nodemailer.createTransport({
                        service: 'gmail',
                        port: 465,
                        secure: true,
                        auth: {
                            user: 'luongvany12@gmail.com',
                            pass: 'wipszgcgfujrrily'
                        }
                    });

                    var mailOptions = {
                        from: 'luongvany12@gmail.com',
                        to: `${user.email}`,
                        subject: 'Xác nhận đăng nhập thành công',
                        text: `Chào bạn, bạn đã đăng nhập vào ứng dụng YShop.\nMã OTP của bạn là ${otp}. 
                    \nMã sẽ có hiệu lực trong vòng 5 phút\nThân ái và quyết thắng!`
                    };

                    transporter.sendMail(mailOptions, function (error, info) {
                        if (error) {
                            console.log(error);
                        } else {
                            console.log('Email sent: ' + info.response);
                        }
                    });
                    return res.status(200).send({ message: "Success", data: results })
                }
            })


        })

    })


}

module.exports.verifyOTP = (req, res) => {
    userService.verifyOTP(req.body, (error, results, message) => {
        if (error) {
            return res.status(400).send({ message: message, data: results })
        }
        return res.status(200).send({ message: message, data: results })
    })
}

module.exports.forgot_password = (req, res) => {
    const { email } = req.body;
    User.findOne({'email': email}).exec(function(err, docs){
        if(err){
            res.status(400).json(err)
        }

        var transporter = nodemailer.createTransport({
            service: 'gmail',
            port: 465,
            secure: true,
            auth: {
                user: 'luongvany12@gmail.com',
                pass: 'wipszgcgfujrrily'
            }
        });

        var mailOptions = {
            from: 'luongvany12@gmail.com',
            to: `${email}`,
            subject: 'Quên mật khẩu',
            text: `Chào bạn, Mật khẩu đăng nhập của bạn là ${docs.pass}. 
        \nMã sẽ có hiệu lực trong vòng 5 phút\nThân ái và quyết thắng!`
        };

        transporter.sendMail(mailOptions, function (error, info) {
            if (error) {
                console.log(error);
            } else {
                console.log('Email sent: ' + info.response);
            }
        });
        
    })
    
}


module.exports.get_all_favorite_item = (req, res) => {
    const userId = req.user.id;
    User.findById(userId).populate({ path: 'favorite_item' }).select('favorite_item -_id').exec(function (err, data) {
        if (err) {
            res.status(400).json(err)
        }

        res.status(200).json(data)
    })
    // User.findById(userId, 'favorite_item, -_id', function(err, data){
    //     if(err){
    //         res.status(400).json(err)
    //     }
    //     res.status(200).json(data)
    // })
}