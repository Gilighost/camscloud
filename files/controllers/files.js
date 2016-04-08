var fs = require('fs'),
    handle_directory = require('../controllers/handle_directory'),
    handle_file = require('../controllers/handle_file')

module.exports = function(req, res, next) {
  var path = '.' + req.url.split('?')[0];
  fs.access(path, fs.F_OK, function(err){
    if(!err){
      if(fs.lstatSync(path).isDirectory()){
        handle_directory(req, res, next, path)
      }
      else if(fs.lstatSync(path).isFile()) {
        handle_file(req, res, next, path)
      }
    } else{
      res.render('notfound')
    }
  })
}
