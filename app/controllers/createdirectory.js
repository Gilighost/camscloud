var fs = require('fs'),
    config  = require('../../config')

module.exports =
  function upload(req, res, next) {
    res.locals.savepath = req.session.cwd || config.cloudDirectory
    res.locals.savepath = res.locals.savepath.slice(1)

    if(req.query.name && req.query.name.indexOf('..') == -1 ){
      console.log(res.locals.savepath + req.query.name)
        fs.mkdir('.' + res.locals.savepath + req.query.name, function(e){
        res.locals.message = {'text': 'Successfully created', 'type': 'success', 'created': req.query.name}
        next()
      });
    } else{
      if(req.query.name && req.query.name.indexOf('..') != -1){
        res.locals.message = {'text': 'ERROR: Invalid path.', 'type': 'danger', 'created': req.query.name}
      }
      next()
    }
  }
