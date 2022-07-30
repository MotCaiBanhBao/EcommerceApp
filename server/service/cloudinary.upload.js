const streamifier = require('streamifier')
const { cloudinary } = require('./cloudinary.config')
require('stream')

exports.upload_one = function (dataBuffer, options) {
  return new Promise((resolve, reject) => {
    cloudinary.uploader.upload_stream(
      options,
      (error, result) => {
        if (result) {
          console.log('OK')
          resolve(result);
        } else {
          console.log('false loi')
          reject(error);
        }
      }
    ).end(dataBuffer)
  }
  )
}