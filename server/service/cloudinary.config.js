const config = require('config');
const cloudinary = require('cloudinary').v2;
const cloud_name = config.get('cloud_name')
const cloud_name_api_key = config.get('cloud_name_api_key')
const cloud_name_api_secret = config.get('cloud_name_api_secret')

cloudinary.config({ 
  cloud_name: cloud_name, 
  api_key: cloud_name_api_key, 
  api_secret: cloud_name_api_secret,
  secure: true
});

module.exports = { cloudinary };