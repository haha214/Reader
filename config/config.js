var path = require('path'),
    rootPath = path.normalize(__dirname + '/..'),
    env = process.env.NODE_ENV || 'development';

var config = {
    development: {
        root: rootPath,
        app: {
            name: 'Reader'
        },
        port: process.env.PORT || 3000,
        db: {
            cookieSecret: 'myapp',
            db: 'pp',
            host: 'localhost',
            port: 27017
        },
        server: 'http://172.29.36.145:8080/bm/'
    },

    test: {
        root: rootPath,
        app: {
            name: 'Personal_portal'
        },
        port: process.env.PORT || 3000,
        db: 'mongodb://localhost:27017/test-app',
        server: 'http://dev.wuanlife.com:800/'
    },

    production: {
        root: rootPath,
        app: {
            name: 'Reader'
        },
        port: process.env.PORT || 3000,
        db: {
            cookieSecret: 'myapp',
            db: 'wuanDB',
            host: 'localhost',
            port: 27017
        },
        server: 'http://172.29.36.145:8080/bm/'
    }
};

module.exports = config[env];