var fs = require('fs'),
    config  = require('../../config')

module.exports =
  function upload(req, res, next) {
    console.log('yo')
    res.locals.savepath = req.session.cwd || config.cloudDirectory
    res.locals.savepath = res.locals.savepath
    if(req.files){
      for(var i = 0; i < req.files.length; i++){
        var file = req.files[i]
        fs.rename(file.path, req.session.cwd + file.originalname)
        req.session.name = file.originalname
        res.locals.upload = file.originalname
      }
    }
    next();
  }