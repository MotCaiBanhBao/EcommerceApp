const {Router} = require('express');
const itemController = require('../controllers/itemControllers');
const router = Router();
const shop_auth = require('../middleware/shop_auth');
const auth = require('../middleware/auth');

router.get('/items', itemController.get_items);
router.post('/items', shop_auth, itemController.post_item);
router.put('/items/:id',itemController.update_item);
router.delete('/items/:id', shop_auth, itemController.delete_item);
router.post('/items/find', itemController.find_item);
router.post('/item/review', auth, itemController.send_comment);
router.get('/item/:id', itemController.get_item_by_id);
router.post('/category', itemController.push_categories)
router.post('/test', auth, itemController.test) 
router.post('/items/test1', itemController.test1)
router.post('/isfavorite', auth, itemController.is_favorite)
router.post('/favorite/un', auth, itemController.un_favorite)
router.post('/favorite/make', auth, itemController.make_favorite)
router.get('/get_all_shop_item', shop_auth, itemController.get_all_shop_item)

module.exports = router;