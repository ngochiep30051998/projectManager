var express = require('express');
var router = express.Router();

const testModel = require('../../models/test');
/* GET home page. */
router.get('/', function (req, res, next) {
  res.render('admin/pages/index', { title: 'Hiep Nguyen' });
});

router.get('/test', async (req, res) => {
  const result = await testModel.getAll();
  return res.json(result);
})
module.exports = router;
