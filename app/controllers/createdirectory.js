var fs = require('fs'),
    config  = require('../../config')

module.exports =
  function upload(req, res, next) {
    res.locals.savepath = req.session.cwd || config.cloudDirectory
    res.locals.savepath = res.locals.savepath.slice(1)
    if(req.session.user.writePermission){
      if(req.query.name && req.query.name.indexOf('..') == -1 ){
          var repeat = 1;
          while(fs.existsSync(req.session.cwd + req.query.name) && fs.lstatSync(req.session.cwd + req.query.name).isDirectory()){
            if(repeat == 1){
              req.query.name = (repeat) + ' ' + req.query.name
            }
            else{
              req.query.name = repeat + req.query.name.slice(1)
            }
            repeat++;
          }
          fs.mkdir(req.session.cwd + req.query.name, function(e){
          if(e){
              res.locals.message = {'text': 'ERROR: Could not create directory.', 'type': 'danger', 'created': req.query.name}
          } else{
            res.locals.message = {'text': 'Successfully created', 'type': 'success', 'created': req.query.name}
          }
          next()
        })
      } else{
        if(req.query.name && req.query.name.indexOf('..') != -1){
          res.locals.message = {'text': 'ERROR: Invalid path.', 'type': 'danger', 'created': req.query.name}
        }
        next()
      }
    } else{
      res.redirect(config.rootUrl)
    }
  }
