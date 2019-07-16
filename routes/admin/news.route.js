const express = require('express');
const router = express.Router();

const newsModel = require('../../models/news.model');

const middleware = require('../../helpers/middleware');
const status = require('../../constants/status');

//upload file
const multer = require('multer');

const upload = multer({ dest: 'public/upload/news/' });

const validateHelper = require('../../helpers/validate');


router.get('/', middleware.LoggedIn, async (req, res) => {
    const result = await newsModel.getAll();
    res.render('admin/pages/project/newsManagement', {
        listNews: result
    });
})

module.exports = router;