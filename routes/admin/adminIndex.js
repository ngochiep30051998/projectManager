var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('admin/pages/index', { title: 'Hiep Nguyen' });
});

module.exports = router;
