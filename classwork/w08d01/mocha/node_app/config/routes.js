var express = require('express');
var router = express.Router();

var appController = require('../controllers/appController');
var nameController = require('../controllers/nameController');

router.route('/')
	.get(appController.helloWorld)

router.route('/will')
	.get(nameController.hello)

module.exports = router