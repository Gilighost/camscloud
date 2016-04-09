var fs = require('fs')

module.exports = function(req, res, next) {
  if(req.body.newname){
    var newname = './' + req.body.newname
    var oldname = './' + req.body.oldname
    if (newname.indexOf('..') != -1 || oldname.indexOf('..') != -1){
      res.redirect(req.url)
    } else{
      fs.rename(oldname, newname, function(){
          res.redirect(req.url)
      })
    }
  } else{
    var uploads = []
    if(req.files){
      for(var i = 0; i < req.files.length; i++){
        var file = req.files[i]
        fs.renameSync(file.path, req.session.cwd + file.originalname)
        req.session.name = file.originalname
        uploads.push(file.originalname)
      }
      for(var i = 0; i < uploads.length; i++)
        uploads[i] = "<kbd>" + uploads[i] + "</kbd>"
      console.log('uploads: ' + uploads)
      req.session.alert = {'type': 'success', 'message': 'Successfully uploaded ' + uploads.join('') }
      console.log('alert: ' + res.locals.alert.message)
      next()
  }
}
}
