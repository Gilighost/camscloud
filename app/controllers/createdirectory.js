var fs = require('fs'),
    config  = require('../../config')

module.exports =
  function upload(req, res, next) {
    res.locals.savepath = req.session.cwd || config.cloudDirectory
    res.locals.savepath = res.locals.savepath.slice(1)
    if(req.query.name){
      console.log(res.locals.savepath + req.query.name)
        fs.mkdir('.' + res.locals.savepath + req.query.name, function(e){
        res.locals.created = req.query.name
        next()
      });
    } else{
      next()
    }
  }
