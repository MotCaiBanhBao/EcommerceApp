exports.createCloudinaryOption = function (fileName, folder) {
    return {
        use_filename: true,
        unique_filename: false,
        overwrite: true,
        public_id: fileName,
        folder: folder
    }
}