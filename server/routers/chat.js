const { Router } = require('express');
const chatController = require('../controllers/chatController');
const router = Router();
const auth = require('../middleware/auth');

router.post('/chat/room_chat', auth, chatController.getChatRoomId);
router.post('/chat', auth, chatController.pushChat)

module.exports = router;