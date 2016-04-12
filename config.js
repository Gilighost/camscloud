/********************************************************************
 Configuration options

 Exports: namespace object
 ********************************************************************/

exports.port = 8000

exports.logLevel = 'dev'

exports.sessionSecret = 'a moose bit my sister once'

exports.rootUrl = 'files/'

exports.rootDir = __dirname

exports.cloudDirectory = './files/'

exports.users =
  {Cam: { name: 'Cameron LaFerney',
          password: 'password',
          writePermission: true
         },
   TambourineMan:   {name: 'Bob Dylan',
                    password: 'blowininthewind',
                    writePermission: true
                   },
   BTK:   { name: 'Billy the Kid',
            password: 'fastdraw',
            writePermission: false
         }
  }
