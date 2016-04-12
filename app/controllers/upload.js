var fs = require('fs'),
    config  = require('../../config')

module.exports =
  function upload(req, res, next) {
    res.locals.savepath = req.session.cwd || config.cloudDirectory
    res.locals.savepath = res.locals.savepath.slice(1)
    res.locals.savepath = decodeURIComponent(res.locals.savepath)
    res.locals.uploads = []
    if(req.session.user.writePermission){
      if(req.files){
        for(var i = 0; i < req.files.length; i++){
          var file = req.files[i]
          var repeat = 1;
          while(fs.existsSync(req.session.cwd + file.originalname) && fs.lstatSync(req.session.cwd + file.originalname).isFile()){
            if(repeat == 1){
              file.originalname = (repeat) + ' ' + file.originalname
            }
            else{
              file.originalname = repeat + file.originalname.slice(1)
            }
            repeat++;
          }
          try{
            fs.renameSync(file.path, req.session.cwd + file.originalname)
          }
          catch(e){
            var text = 'ERROR: Could not upload '
            text += (req.files.length > 1) ? 'one or more files.' : 'file.'
            res.locals.message = {'text': text, 'type': 'danger'}
          }
          req.session.name = file.originalname
          res.locals.uploads.push(file.originalname)
        }
      }
      next();

    }
    else{
      res.redirect(config.rootUrl)
    }
  }
