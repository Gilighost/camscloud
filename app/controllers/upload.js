var fs = require('fs'),
    config  = require('../../config')

module.exports =
  function upload(req, res, next) {
    res.locals.savepath = req.session.cwd || config.cloudDirectory
    res.locals.savepath = res.locals.savepath.slice(1)
    res.locals.savepath = decodeURIComponent(res.locals.savepath)
    res.locals.uploads = []
    if(req.files){
      for(var i = 0; i < req.files.length; i++){
        var file = req.files[i]
        fs.rename(file.path, req.session.cwd + file.originalname)
        req.session.name = file.originalname
        res.locals.uploads.push(file.originalname)
      }
    }
    next();
  }
