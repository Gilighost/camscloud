var fs = require('fs');

function deleteFolderRecursive(path) {
  if( fs.existsSync(path) ) {
    fs.readdirSync(path).forEach(function(file,index){
      var curPath = path + "/" + file;
      if(fs.lstatSync(curPath).isDirectory()) { // recurse
        deleteFolderRecursive(curPath);
      } else { // delete file
        fs.unlinkSync(curPath);
      }
    });
    fs.rmdirSync(path);
  }
};

module.exports = function(req, res, next, path){
  if(req.query.action == 'delete'){
    if(req.session.user.writePermission){
      deleteFolderRecursive(path)
    }
    res.redirect(req.url.split('/').slice(0, -1).join('/') + '/')
  } else if(path.slice(-1) != '/'){
      res.redirect(req.url + '/')
  } else{
    fs.readdir(path, function(err, data){
      req.session.cwd = path
      var directories = []
      var files = [];
      for(var i = 0; i < data.length; i++){
        if(fs.lstatSync(path + data[i]).isDirectory()){
          directories.push({'dirName': data[i], 'href': data[i] + '/', 'deletehref': req.url + data[i]})
        }else {
          files.push(data[i])
        }
      }
      var urlParts = req.url.split('/')
      var dirPath = []
      var filePath = ""
      for(var i = 1; i < urlParts.length - 1; i++){
        filePath += "/" + decodeURIComponent(urlParts[i]);
        dirPath.push({'name': decodeURIComponent(urlParts[i]), 'href': filePath })
      }
      var obj = {}

      res.locals.files = files
      res.locals.directories = directories
      res.locals.dirPath = dirPath
      next()
    })
  }
}
