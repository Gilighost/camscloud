var fs = require('fs')

module.exports = function(req, res, next) {
  if(req.session.user.writePermission){
    var newname = './' + req.body.newname
    var oldname = './' + req.body.oldname
    if (newname.indexOf('..') != -1 || oldname.indexOf('..') != -1){
      res.redirect(req.url)
    } else{
      fs.rename(oldname, newname, function(){
          res.redirect(req.url)
      })
    }
  }
  else{
      res.redirect(req.url)
  }
}
