const { Router } = require('express');
const notificationController = require('../controllers/notification');
const router = Router();
const auth = require('../middleware/auth');

router.get('/notification', auth, notificationController.getNotification);
router.post('/make_chat_noti_watched', auth, notificationController.make_chat_noti_watched);
module.exports = router;