var express = require('express');
var path = require('path');
var favicon = require('serve-favicon');
var logger = require('morgan');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');

var index = require('./routes/index');
var sort = require('./routes/sort.js');
var list = require('./routes/list.js');
var api = require('./routes/api.js');
var myBooks = require('./routes/myBooks.js');
var dynamics = require('./routes/dynamics.js');
var topical = require('./routes/topical.js');
var sourceList = require('./routes/sourceList.js');
var fpub = require('./routes/fpub.js');


var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

// uncomment after placing your favicon in /public
//app.use(favicon(path.join(__dirname, 'public', 'favicon.ico')));
app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', index);
app.use('/sort',sort);
app.use('/list',list);
app.use('/api',api);
app.use('/myBooks',myBooks);
app.use('/dynamics',dynamics);
app.use('/topical',topical);
app.use('/sourceList',sourceList);
app.use('/fpub',fpub);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  var err = new Error('Not Found');
  err.status = 404;
  next(err);
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
