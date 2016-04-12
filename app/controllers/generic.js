
exports.renderTemplate = function renderTemplate(name) {
  return function (req, res) {
    var obj = {}
    obj.user = req.session.user
    res.render(name, obj)
  }
}

exports.redirect = function redirect(url) {
  return function (req, res, next) {
    res.redirect(url)
  }
}

exports.requireLogin = function requireLogin(req, res, next) {
  if (! req.session.user) {
    res.redirect('/login')
  }
  else {
    next()
  }
}
