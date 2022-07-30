const { Router } = require('express');
const authController = require('../controllers/authControllers');
const router = Router();
const auth = require('../middleware/auth');
const shop_auth = require('../middleware/shop_auth');
router.post('/register', authController.signup);
router.post('/login', authController.login);
router.get('/user', auth, authController.get_user);
router.post('/otpLogin', authController.otpLogin);
router.post('/verifyOTP', authController.verifyOTP);
router.post('/update_avatar', auth, authController.uploadAvatar)
router.post('/shopRegistration', auth, authController.shopRegistration)
router.post('/get_user_avatar', authController.getUserAvatar)
router.get('/get_favorite_item', auth, authController.get_all_favorite_item)
router.get('/shop_data', shop_auth, authController.getShopData)
router.get('/item_test', shop_auth, authController.test)
router.post('/resetPassword', auth, authController.resetPassword)
router.post('/get_another_user', authController.get_another_user)

module.exports = router;