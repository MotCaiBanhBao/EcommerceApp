const multer = require("multer");
const cloudinary = require("cloudinary").v2;
const cloudinaryStorage = require("multer-storage-cloudinary");
import streamifier from 'streamifier';

const storage = cloudinaryStorage({
    params: async (req, file) => {
      console.loq(req)
        return {
          folder: 'folder_name',
          format: 'jpeg',
          public_id: 'some_unique_id',
        };
      },
    allowedFormats: ["jpg", "png"],
    transformation: [{
        width: 500,
        height: 500,
        crop: "limit"
    }],
    cloudinary: cloudinary
});


module.exports = multer({ storage: storage });
