/********************************************************************
 Define routes for Cam's Cloud
 Exports: router
 ********************************************************************/

var express = require('express'),
    multer  = require('multer'),
    config  = require('../config'),
    generic = require('./controllers/generic'),
    fs = require('fs'),
    path = require('path');

var router = express.Router();

// Uploads
var upload = multer({ dest: './tmp/' });

router.get('/files', function(req, res, next){generic.requireLogin(req, res, next)}, require('./controllers/files'), generic.renderTemplate('files'));

router.get('/files/*',function(req, res, next){generic.requireLogin(req, res, next)}, require('./controllers/files'),  generic.renderTemplate('files'));

router.get('/upload', function(req, res, next){generic.requireLogin(req, res, next)},require('./controllers/upload'), generic.renderTemplate('upload'));
router.post('/upload',
            upload.any('myfile'),
            require('./controllers/upload'),
            generic.renderTemplate('upload')
);

router.get('/createdirectory', function(req, res, next){generic.requireLogin(req, res, next)},require('./controllers/createdirectory'), generic.renderTemplate('createdirectory'));

router.post('/login',
            require('./controllers/login'),
            generic.renderTemplate('login')
);
router.get('/login', generic.renderTemplate('login'));

router.get('/logout', require('./controllers/logout'));

router.get('/',  function(req, res, next){generic.requireLogin(req, res, next)}, generic.redirect(config.cloudDirectory));
// Export
module.exports = router;
