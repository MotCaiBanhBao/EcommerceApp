const express = require('express');
const router = express.Router();
const uploadController = require('../controllers/uploadController')


router.post('/upload', uploadController.upload_multiple_file)
// router.get('/download/:imageID', uploadController.download_file)
// router.delete("/delete/:imageID", uploadController.delete_file)
  
module.exports = router;