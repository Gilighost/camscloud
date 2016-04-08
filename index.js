/********************************************************************
 Main:  run express application
 ********************************************************************/

process.env.NODE_ENV = process.env.NODE_ENV || 'development';

var app = require('./app'),
    config = require('./config');

console.log("Listening on port " + config.port + "...");
app.listen(config.port);
