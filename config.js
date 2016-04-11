/********************************************************************
 Configuration options

 Exports: namespace object
 ********************************************************************/

exports.port = 8000;

exports.logLevel = 'dev';

exports.sessionSecret = 'a moose bit my sister once';

exports.rootUrl = 'files/'

exports.rootDir = __dirname

exports.cloudDirectory = './files/'

exports.users =
  {Cam: { name: 'Cameron LaFerney',
          password: 'password',
          writePrivelege: true
         },
   TambourineMan:   {name: 'Bob Dylan',
                    password: 'blowininthewind',
                    writePrivelege: true
                   },
   BTK:   { name: 'Billy the Kid',
            password: 'fastdraw',
            writePrivelege: false
         }
  };
