var fs = require('fs'),
    mime = require('mimetype'),
    config  = require('../../config')

module.exports = function(req, res, next, path){
  if(req.query && req.query.action != 'view'){
    mimetype = mime.lookup(path)
    res.setHeader('Content-disposition', 'attachment; filename=' + path.split('/').slice(-1))
    res.setHeader('Content-type', mimetype)

    if(req.query.action == 'download'){
      var filestream = fs.createReadStream(path);
      filestream.pipe(res);
    } else if(req.query.action == 'delete'){
      fs.unlink(path, function(err){
        res.redirect(req.url.split('/').slice(0, -1).join('/'))
      })
    }
  }
  else{
    res.sendFile(path, {'root': config.rootDir})
  }
}
