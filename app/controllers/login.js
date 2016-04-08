var config = require('../../config');

module.exports =
  function(req, res, next) {
    if (req.body.username in config.users) {
      if (req.body.password == config.users[req.body.username].password) {
        req.session.user = config.users[req.body.username];
        console.log('Success')
        res.redirect(config.rootUrl)
      }
      else {
        res.locals.error = 'Invalid password';
        console.log('Incorrect password')
        next();
      }
    }
    else {
      res.locals.error = 'Unknown user';
      console.log('Unknown user')
      next();
    }
  }
