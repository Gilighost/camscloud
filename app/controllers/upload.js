var fs = require('fs'),
    config  = require('../../config')
    filesController = require('../controllers/files')

module.exports =
  function upload(req, res, next) {
    res.locals.savepath = req.session.cwd || config.cloudDirectory
    res.locals.savepath = res.locals.savepath.slice(1)
    res.locals.savepath = decodeURIComponent(res.locals.savepath)
    var uploads = []
    if(req.files){
      for(var i = 0; i < req.files.length; i++){
        var file = req.files[i]
        fs.renameSync(file.path, req.session.cwd + file.originalname)
        req.session.name = file.originalname
        uploads.push(file.originalname)
      }
      // for(var i = 0; i < uploads.length; i++)
      //   uploads[i] = "<kbd>" + uploads[i] + "</kbd>"
      // console.log('uploads: ' + uploads)
      // req.session.alert = {'type': 'success', 'message': 'Successfully uploaded ' + uploads.join('') }
      // console.log('alert: ' + res.locals.alert.message)
    }
    res.redirect(res.locals.savepath)
  }
