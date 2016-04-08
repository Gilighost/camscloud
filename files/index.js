/********************************************************************
 Create and initialize express application

 Exports: application
 ********************************************************************/
var config   = require('../config'),
    express  = require('express'),
    morgan   = require('morgan'),
    parser   = require('body-parser'),
    session  = require('express-session'),
    hbengine = require('express-handlebars'),
    multer   = require('multer');

// Create application
var app = express();

// Configure template engine
app.engine('hb', hbengine({
  defaultLayout: null,
  partialsDir: './views/partials',
  extname: '.hb'
}));
app.set("view engine", "hb");

// Configure session
app.use(session({
  secret: config.sessionSecret,
  saveUninitialized: false,
  resave: false,
}));

// Parse POST requests
app.use(parser.urlencoded({ extended: false }));

// Logging
app.use(morgan(config.logLevel));

// Routes
app.use('/', require('./routes'));

// Fallback to static
app.use(express.static('./public'));

//Error 404
app.use(function(req, res, next) {
  res.status(404).render('notfound');
});

// Export app
module.exports = app;
