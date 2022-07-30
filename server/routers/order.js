const { Router } = require('express');
const orderController = require('../controllers/orderControllers');
const router = Router();
const auth = require('../middleware/auth');
const shop_auth = require('../middleware/shop_auth')

router.get('/orders',auth, orderController.get_orders);
router.post('/get_order', auth, orderController.get_order);
router.post('/orders', auth, orderController.checkout);
router.get('/shop_get_orders', shop_auth, orderController.shop_get_order);
router.post('/change_order_status', shop_auth, orderController.change_order_status)
router.post('/cancell', auth, orderController.cancell)
router.post('/confirm', auth, orderController.confirmAndReview);

module.exports = router;