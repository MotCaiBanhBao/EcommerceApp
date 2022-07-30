const mongoose = require('mongoose');
// const cloudinary = require('cloudinary'))
const {upload_one} = require('../service/cloudinary.upload')
var fs = require('fs');;


module.exports.upload_multiple_file = async (req, res) => {

  const options = {
    use_filename: true,
    unique_filename: false,
    overwrite: true,
    public_id: Math.floor(Math.random() * 1000),
    folder: 'Test'
  };

  try {
    let pictureFiles = req.files.product;
    // console.log(pictureFiles.length)
    //Check if files exist
    if (!pictureFiles)
      return res.status(400).json({ message: "No picture attached!" });

    let multiplePicturePromise = pictureFiles.map((picture) =>
    upload_one(picture.data, options)) ;
    // await all the cloudinary upload functions in promise.all, exactly where the magic happens
    let data = await Promise.all(multiplePicturePromise)
    data.forEach(value => console.log(value.url))
    res.status(200).json({
      message: data
    })
  } catch (err) {
    res.status(400).json({
      message: err.message,
    });
  }
}
// let filename = req.files.file.name; 
// var gridfsbucket = createGridfsbucket("filesBucket", 1024)
// upload_file_helper(req.files.file.data, filename,  (error) => {
//     res.status(404).json({
//         success: false,
//         msg: error
//     })
// },  () => {
//     console.log('done!');
//     res.status(200).json({
//         success: true,
//         msg: 'File Uploaded successfully..'
//     });
// }, gridfsbucket)
