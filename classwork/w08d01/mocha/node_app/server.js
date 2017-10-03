var express = require('express');
var path = require('path');
var app = express(); 
var server = require('http').createServer(app);
var port = process.env.Port || 3000

//Setting up the routes

var routes = require('./config/routes');
app.use(routes);

server.listen(port, function(){
	console.log('App is listening on port 3000')
});